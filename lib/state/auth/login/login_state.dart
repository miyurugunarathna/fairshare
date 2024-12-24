part of 'login_bloc.dart';

class LoginState extends Equatable {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final bool showPassword;
  final bool loading;
  final AuthType? attemptedType;
  final GlobalKey<FormState>? formKey;

  LoginState({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    this.showPassword = false,
    this.loading = false,
    this.attemptedType,
    this.formKey,
  }) {
    this.emailController = emailController ?? TextEditingController();
    this.passwordController = passwordController ?? TextEditingController();
  }

  LoginState copyWith(
          {TextEditingController? emailController,
          TextEditingController? passwordController,
          bool? showPassword,
          bool? loading,
          AuthType? attemptedType,
          GlobalKey<FormState>? formKey}) =>
      LoginState(
        emailController: emailController ?? this.emailController,
        passwordController: passwordController ?? this.passwordController,
        showPassword: showPassword ?? this.showPassword,
        loading: loading ?? this.loading,
        attemptedType: attemptedType ?? this.attemptedType,
        formKey: formKey ?? this.formKey,
      );

  @override
  List get props => [emailController, passwordController, showPassword, loading, attemptedType, formKey];
}
