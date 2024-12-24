import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fairshare/components/common/core/core.dart';
import 'package:fairshare/state/auth/auth_bloc.dart';
import 'package:fairshare/state/auth/login/login_bloc.dart';

class PrimaryAction extends StatelessWidget {
  const PrimaryAction({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.loading != current.loading || previous.attemptedType != current.attemptedType,
      builder: (context, state) {
        final b = context.read<LoginBloc>();
        return Column(
          children: [
            RoundedTextButton(
              AppLocalizations.of(context)!.signIn,
              loading: state.loading && state.attemptedType == AuthType.EMAIL,
              disabled: state.loading,
              onPressed: () {
                b.add(FormSubmit(context, AuthType.EMAIL));
              },
            ),
          ],
        );
      },
    );
  }
}
