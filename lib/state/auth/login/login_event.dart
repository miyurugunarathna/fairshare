part of 'login_bloc.dart';

class LoginEvent {
  const LoginEvent();
}

class FormSubmit extends LoginEvent {
  final AuthType type;
  final BuildContext context;
  const FormSubmit(this.context, this.type);
}

class ToggleShowPassword extends LoginEvent {}

class SetFormKey extends LoginEvent {
  final GlobalKey<FormState> key;
  const SetFormKey(this.key);
}

class Reset extends LoginEvent {}
