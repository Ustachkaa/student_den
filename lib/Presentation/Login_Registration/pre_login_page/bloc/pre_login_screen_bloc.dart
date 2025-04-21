import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/app_export.dart';
import '../models/pre_login_screen_model.dart';
part 'pre_login_screen_event.dart';
part 'pre_login_screen_state.dart';

/// A bloc that manages the state of a PreLoginScreen according to the event that is dispatched to it.
class PreLoginScreenBloc extends Bloc<PreLoginScreenEvent, PreLoginScreenState> {
  /// Call state
  PreLoginScreenBloc(PreLoginScreenState initialState) : super(initialState) {
    on<PreLoginScreenInitialEvent>(_onInitialize);
  }

  Future<void> _onInitialize(
      PreLoginScreenInitialEvent event,
      Emitter<PreLoginScreenState> emit,
      ) async {}
}
