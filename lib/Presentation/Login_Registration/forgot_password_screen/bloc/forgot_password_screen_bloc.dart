import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_den/core/app_export.dart';
import 'package:student_den/Presentation/Login_Registration/forgot_password_screen/model/forgot_password_screen_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'forgot_password_screen_event.dart';
part 'forgot_password_screen_state.dart';

///Implement the Bloc to manage the state
class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  /// Set the states here
  ForgotPasswordBloc(ForgotPasswordState initialState) : super(initialState) {
    on<ForgotPasswordInitialEvent>(_onInitialize);
    on<ResetPasswordEvent>(_onResetPassword);
  }

  /// Implemented when initial
  Future<void> _onInitialize(
      ForgotPasswordInitialEvent event,
      Emitter<ForgotPasswordState> emit,
      ) async {
    emit(state.copyWith(
      emailController: TextEditingController(),
    ));
  }

  /// Implemented when reset Password, typically calling API here
  Future<void> _onResetPassword(
      ResetPasswordEvent event,
      Emitter<ForgotPasswordState> emit,
      ) async {
    emit(state.copyWith(status: ForgotPasswordStatus.loading));
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: event.email);
      emit(state.copyWith(status: ForgotPasswordStatus.success));
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Failed to send reset email.';
      if (e.code == 'auth/user-not-found') {
        errorMessage = 'There is no user record corresponding to this email.';
      }
      emit(state.copyWith(
          status: ForgotPasswordStatus.failure, errorMessage: errorMessage));
    } catch (e) {
      emit(state.copyWith(
          status: ForgotPasswordStatus.failure,
          errorMessage: 'An unexpected error occurred.'));
    }
  }
}
