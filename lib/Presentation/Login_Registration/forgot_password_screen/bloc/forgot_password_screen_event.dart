part of 'forgot_password_screen_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ForgotPasswordInitialEvent extends ForgotPasswordEvent {}

class ResetPasswordEvent extends ForgotPasswordEvent {
  final String email;

  ResetPasswordEvent(this.email);

  @override
  List<Object> get props => [email];
}