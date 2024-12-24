import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fairshare/components/common/core/buttons/buttons.dart';
import 'package:fairshare/components/common/core/buttons/rounded_text_button/variants.dart';
import 'package:fairshare/config/themes/themes.dart';
import 'package:fairshare/constants/constants.dart';

void showQuestionDialog(BuildContext context, {required String question, required Function(BuildContext context) onYes, required Function(BuildContext context) onNo}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.background,
        content: Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 300),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(
                Icons.question_mark_rounded,
                size: 100,
              ),
              const SizedBox(height: 16),
              Text(
                question,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmallSecondary,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RoundedTextButton(
                  AppLocalizations.of(context)!.yes,
                  onPressed: () => onYes(context),
                  padding: const EdgeInsets.symmetric(horizontal: universalPadding, vertical: 8),
                ),
                const SizedBox(height: 8),
                RoundedTextButton(
                  AppLocalizations.of(context)!.no,
                  type: ButtonType.secondary,
                  onPressed: () => onNo(context),
                  padding: const EdgeInsets.symmetric(horizontal: universalPadding, vertical: 8),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
