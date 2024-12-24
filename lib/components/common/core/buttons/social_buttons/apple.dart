import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fairshare/components/common/core/buttons/buttons.dart';

class AppleButton extends StatelessWidget {
  final bool? signIn;
  final bool? loading;
  final bool? disabled;
  final VoidCallback onPressed;
  const AppleButton({super.key, this.signIn = true, this.loading = false, this.disabled = false, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return const SizedBox.shrink();
    }
    return RoundedTextButton(
      signIn! ? AppLocalizations.of(context)!.signInWithApple : AppLocalizations.of(context)!.signUpWithApple,
      color: Colors.white,
      textColor: Colors.black,
      prefixIcon: FontAwesomeIcons.apple,
      loading: loading,
      disabled: disabled,
      onPressed: onPressed,
    );
  }
}
