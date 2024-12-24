import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fairshare/constants/constants.dart';

enum UserRole {
  CUSTOMER("Customer"),
  GUEST("Guest");

  const UserRole(this.text);

  String localizedValue() {
    if (text == UserRole.CUSTOMER.text) {
      return AppLocalizations.of(GlobalKeys.navigatorKey.currentContext!)!.customer;
    } else if (text == UserRole.GUEST.text) {
      return AppLocalizations.of(GlobalKeys.navigatorKey.currentContext!)!.guest;
    }
    return text;
  }

  final String text;
}
