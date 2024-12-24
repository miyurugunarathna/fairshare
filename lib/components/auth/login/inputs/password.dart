import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_validator/form_validator.dart';
import 'package:fairshare/components/common/core/core.dart';
import 'package:fairshare/state/auth/login/login_bloc.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.passwordController != current.passwordController || previous.showPassword != current.showPassword,
      builder: (context, state) {
        return CustomInput(
          controller: state.passwordController,
          placeholder: AppLocalizations.of(context)!.typeYourPassword,
          prefixIcon: const Icon(
            Icons.lock,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              !state.showPassword ? Icons.visibility_off : Icons.visibility,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () => context.read<LoginBloc>().add(ToggleShowPassword()),
          ),
          obscureText: !state.showPassword,
          validator: ValidationBuilder(requiredMessage: AppLocalizations.of(context)!.pleaseEnterYourPassword).required().build(),
        );
      },
    );
  }
}
