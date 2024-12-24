import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:readmore/readmore.dart';
import 'package:fairshare/config/themes/themes.dart';

class SeeMoreText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int trimLines;
  const SeeMoreText(this.text, {super.key, this.style, this.trimLines = 2});

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      style: style,
      trimLines: trimLines,
      trimCollapsedText: AppLocalizations.of(context)!.seeMore,
      trimExpandedText: AppLocalizations.of(context)!.seeLess,
      moreStyle: const TextStyle(color: AppColors.systemRed),
      lessStyle: const TextStyle(color: AppColors.systemRed),
    );
  }
}
