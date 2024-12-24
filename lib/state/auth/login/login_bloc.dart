import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fairshare/services/auth/auth.service.dart';
import 'package:fairshare/services/core/cache.service.dart';
import 'package:fairshare/state/auth/auth_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<FormSubmit>((event, emit) async {
      final authbloc = BlocProvider.of<AuthBloc>(event.context);
      emit(state.copyWith(loading: true, attemptedType: event.type));
      if (event.type == AuthType.EMAIL) {
        if (state.formKey!.currentState!.validate()) {
          final result = await AuthService.login(state.emailController.text, state.passwordController.text);
          if (result != null && event.context.mounted) {
            await CacheService.setAPIAccessToken(result.accessToken);
            if (event.context.mounted) authbloc.add(Authenticate(event.context, result.user));
            add(Reset());
          }
        }
      } else {
        final userCredential = await AuthBloc.getSocialUserCredential(event.context, event.type);
        if (userCredential?.user != null && event.context.mounted) {
         // call social login api
        }
      }
      emit(state.copyWith(loading: false));
    });
    on<ToggleShowPassword>((event, emit) {
      emit(state.copyWith(showPassword: !state.showPassword));
    });
    on<SetFormKey>((event, emit) {
      emit(state.copyWith(formKey: event.key));
    });
    on<Reset>((event, emit) {
      emit(LoginState());
    });
  }
}
