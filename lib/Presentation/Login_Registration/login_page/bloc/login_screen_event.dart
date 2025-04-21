part of 'login_screen_bloc.dart';

abstract class LoginScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginScreenInitialEvent extends LoginScreenEvent {}

class LoginUser extends LoginScreenEvent {
  LoginUser({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}
