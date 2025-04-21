import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/app_export.dart';
import '../model/login_screen_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'login_screen_event.dart';
part 'login_screen_state.dart';

/// A bloc that manages the state of a LoginScreen according to the event that is dispatched
class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  /// Call state
  LoginScreenBloc(LoginScreenState initialState) : super(initialState) {
    on<LoginScreenInitialEvent>(_onInitialize);
    on<LoginUser>(_onLoginUser);
  }

  /// Initialize function
  Future<void> _onInitialize(
      LoginScreenInitialEvent event,
      Emitter<LoginScreenState> emit,
      ) async {
    emit(
      state.copyWith(
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
      ),
    );
  }

  Future<void> _onLoginUser(LoginUser event, Emitter<LoginScreenState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(state.copyWith(status: LoginStatus.success));
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Login failed.';
      if (e.code == 'user-not-found') {
        errorMessage = 'User not found.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password.';
      }
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: errorMessage));
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: 'An unexpected error occurred.'));
    }
  }
}
