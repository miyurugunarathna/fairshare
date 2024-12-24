import 'package:intl_phone_number_input/intl_phone_number_input.dart';

extension PhoneNumberExt on PhoneNumber {
  String emptiableValue() {
    if (phoneNumber == dialCode) {
      return "";
    }
    return phoneNumber ?? "";
  }
}
