// lib/presentation/forgot_password_screen/bloc/forgot_password_screen_state.dart

part of 'forgot_password_screen_bloc.dart';

enum ForgotPasswordStatus { initial, loading, success, failure }

/// To implement the State for the screen
class ForgotPasswordState extends Equatable {
  /// Call properties of the code
  ForgotPasswordState({
    this.emailController,
    this.isResetEmailSent = false,
    required this.forgotPasswordModelObj,
    this.status = ForgotPasswordStatus.initial,
    this.errorMessage,
  });

  /// Set properties for email TextEditingController
  final TextEditingController? emailController;

  /// Check if it send email or not
  final bool isResetEmailSent;

  /// Implement ForgotPasswordModel
  final ForgotPasswordModel forgotPasswordModelObj;

  /// State of Forgot password
  final ForgotPasswordStatus status;

  /// Error when happens
  final String? errorMessage;

  /// Function for call with properties
  ForgotPasswordState copyWith({
    TextEditingController? emailController,
    bool? isResetEmailSent,
    ForgotPasswordModel? forgotPasswordModelObj,
    ForgotPasswordStatus? status,
    String? errorMessage,
  }) {
    return ForgotPasswordState(
      emailController: emailController ?? this.emailController,
      isResetEmailSent: isResetEmailSent ?? this.isResetEmailSent,
      forgotPasswordModelObj: forgotPasswordModelObj ?? this.forgotPasswordModelObj,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    emailController,
    isResetEmailSent,
    forgotPasswordModelObj,
    status,
    errorMessage,
  ];

}
