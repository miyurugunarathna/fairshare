import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoDataWidget extends StatelessWidget {
  final String? message;
  final double size;

  const NoDataWidget({
    super.key,
    this.message,
    this.size = 220.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.hourglass_empty,
            size: size,
          ),
          const SizedBox(height: 10),
          Text(
            message ?? AppLocalizations.of(context)!.noDataAvailable,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.blueGrey,
                ),
          ),
        ],
      ),
    );
  }
}
