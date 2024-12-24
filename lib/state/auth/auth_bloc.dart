import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fairshare/routes/routes.dart';
import 'package:fairshare/services/auth/auth.service.dart';
import 'package:fairshare/services/core/apple.service.dart';
import 'package:fairshare/services/core/cache.service.dart';
import 'package:fairshare/services/core/facebook.service.dart';
import 'package:fairshare/services/core/google.service.dart';
import 'package:fairshare/services/user/model/user.dart';
import 'package:fairshare/state/main.dart';
import 'package:fairshare/utils/utils.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<Authenticate>((event, emit) {
      if (!event.context.mounted) return;
      CacheService.setAuthUser(event.user.toJson());
      emit(state.copyWith(currentUser: event.user));
      Navigator.pushNamedAndRemoveUntil(event.context, Routes.home, (route) => false);
    });
    on<SetCurrentUser>((event, emit) {
      CacheService.setAuthUser(event.user.toJson());
      emit(state.copyWith(currentUser: event.user));
    });
    on<RefreshUser>((event, emit) async {
      final user = await AuthService.getCurrentUser(useCache: false);
      if (user != null && event.context.mounted) {
        emit(state.copyWith(currentUser: user));
      }
    });
    on<Logout>((event, emit) {
      Cache.clear();
      GoogleService.logout();
      FacebookService.logout();
      firebase.FirebaseAuth.instance.signOut();
      resetStates(event.context);
      if (event.navigate) {
        Navigator.pushReplacementNamed(event.context, Routes.login);
      }
    });
    on<Reset>((event, emit) async {
      emit(const AuthState());
    });
  }

  static Future<firebase.UserCredential?> getSocialUserCredential(BuildContext context, AuthType attemptedAuthType) async {
    firebase.AuthCredential? credential;
    if (attemptedAuthType == AuthType.APPLE) {
      credential = await AppleService.login();
    } else if (attemptedAuthType == AuthType.GOOGLE) {
      credential = await GoogleService.login();
    } else if (attemptedAuthType == AuthType.FACEBOOK) {
      credential = await FacebookService.login();
    }
    if (credential != null && context.mounted) {
      return firebase.FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
  }
}
