part of 'login_screen_bloc.dart';

enum LoginStatus { initial, loading, success, failure }

/// Represents the state of LoginScreen in the application.
// ignore_for_file: must_be_immutable
class LoginScreenState extends Equatable {
  /// Call instance to implement
  const LoginScreenState({
    this.emailController,
    this.passwordController,
    this.loginScreenModelObj,
    this.status = LoginStatus.initial,
    this.errorMessage,
  });

  /// To set and get email values
  final TextEditingController? emailController;

  /// To set and get password values
  final TextEditingController? passwordController;

  /// Implement model here
  final LoginScreenModel? loginScreenModelObj;

  /// Set the status
  final LoginStatus status;

  /// Show when error appears
  final String? errorMessage;

  @override
  List<Object?> get props => [
    emailController,
    passwordController,
    loginScreenModelObj,
    status,
    errorMessage,
  ];

  /// Implemented to copy all values
  LoginScreenState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    LoginScreenModel? loginScreenModelObj,
    LoginStatus? status,
    String? errorMessage,
  }) {
    return LoginScreenState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      loginScreenModelObj: loginScreenModelObj ?? this.loginScreenModelObj,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
