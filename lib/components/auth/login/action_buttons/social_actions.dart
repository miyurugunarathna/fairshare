import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fairshare/components/common/core/core.dart';
import 'package:fairshare/state/auth/auth_bloc.dart';
import 'package:fairshare/state/auth/login/login_bloc.dart';

class SocialActions extends StatelessWidget {
  const SocialActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.loading != current.loading || previous.attemptedType != current.attemptedType,
      builder: (context, state) {
        final b = context.read<LoginBloc>();
        return Column(
          children: [
            AppleButton(
              loading: state.loading && state.attemptedType == AuthType.APPLE,
              disabled: state.loading,
              onPressed: () {
                b.add(FormSubmit(context, AuthType.APPLE));
              },
            ),
            const SizedBox(height: 8),
            GoogleButton(
              loading: state.loading && state.attemptedType == AuthType.GOOGLE,
              disabled: state.loading,
              onPressed: () {
                b.add(FormSubmit(context, AuthType.GOOGLE));
              },
            ),
            const SizedBox(height: 8),
            FacebookButton(
              loading: state.loading && state.attemptedType == AuthType.FACEBOOK,
              disabled: state.loading,
              onPressed: () {
                b.add(FormSubmit(context, AuthType.FACEBOOK));
              },
            ),
          ],
        );
      },
    );
  }
}
