import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fairshare/components/common/core/buttons/buttons.dart';

class FacebookButton extends StatelessWidget {
  final bool? signIn;
  final bool? loading;
  final bool? disabled;
  final VoidCallback onPressed;
  const FacebookButton({super.key, this.signIn = true, this.loading = false, this.disabled = false, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RoundedTextButton(
      signIn! ? AppLocalizations.of(context)!.signInWithFB : AppLocalizations.of(context)!.signUpWithFB,
      color: const Color.fromARGB(255, 229, 237, 255),
      textColor: const Color.fromARGB(255, 29, 91, 225),
      prefixIcon: FontAwesomeIcons.facebookF,
      loading: loading,
      disabled: disabled,
      onPressed: onPressed,
    );
  }
}
