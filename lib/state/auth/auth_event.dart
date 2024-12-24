part of 'auth_bloc.dart';

class AuthEvent {
  const AuthEvent();
}

class Authenticate extends AuthEvent {
  final BuildContext context;
  final User user;
  final bool isSignUp;
  const Authenticate(this.context, this.user, {this.isSignUp = false});
}

class SetCurrentUser extends AuthEvent {
  final User user;
  const SetCurrentUser(this.user);
}

class RefreshUser extends AuthEvent {
  final BuildContext context;
  const RefreshUser(this.context);
}

class Logout extends AuthEvent {
  final BuildContext context;
  final bool navigate;
  const Logout(this.context, {this.navigate = true});
}

class Reset extends AuthEvent {}
