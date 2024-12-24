part of 'auth_bloc.dart';

enum AuthType {
  EMAIL,
  GOOGLE,
  FACEBOOK,
  APPLE,
}

class AuthState extends Equatable {
  final User? currentUser;

  const AuthState({this.currentUser});

  AuthState copyWith({User? currentUser}) => AuthState(
        currentUser: currentUser ?? this.currentUser,
      );

  @override
  List get props => [currentUser];
}
