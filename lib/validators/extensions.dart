import 'package:form_validator/form_validator.dart';

extension CustomValidationBuilder on ValidationBuilder {
  ValidationBuilder equals(String value, String? message) => add((curr) {
    if (curr == value) {
      return null;
    }
    return message;
  });
}
