import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

TextInputFormatter decimalPointFormatter(int places) {
  return FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,' + places.toString() + '}'));
}

TextInputFormatter alphabeticalFormatter() {
  return FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"));
}

NumberFormat thousandDigitFormatter = NumberFormat.decimalPatternDigits(
  locale: 'en_us',
  decimalDigits: 2,
);
