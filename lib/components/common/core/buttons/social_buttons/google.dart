import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fairshare/components/common/core/buttons/buttons.dart';

class GoogleButton extends StatelessWidget {
  final bool? signIn;
  final bool? loading;
  final bool? disabled;
  final VoidCallback onPressed;
  const GoogleButton({super.key, this.signIn = true, this.loading = false, this.disabled = false, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const SizedBox.shrink();
    }
    return RoundedTextButton(
      signIn! ? AppLocalizations.of(context)!.signInWithGoogle : AppLocalizations.of(context)!.signUpWithGoogle,
      color: const Color.fromARGB(255, 255, 237, 240),
      textColor: const Color.fromARGB(255, 221, 77, 66),
      prefixIcon: FontAwesomeIcons.google,
      loading: loading,
      disabled: disabled,
      onPressed: onPressed,
    );
  }
}
