import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_validator/form_validator.dart';
import 'package:fairshare/components/common/core/core.dart';
import 'package:fairshare/state/auth/login/login_bloc.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.emailController != current.emailController,
      builder: (context, state) {
        return CustomInput(
          controller: state.emailController,
          placeholder: AppLocalizations.of(context)!.typeYourEmail,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(
            Icons.email,
          ),
          validator: ValidationBuilder(requiredMessage: AppLocalizations.of(context)!.pleaseEnterYourEmailAddress)
              .required()
              .email(AppLocalizations.of(context)!.pleaseEnterAValidEmailAddress)
              .build(),
        );
      },
    );
  }
}
