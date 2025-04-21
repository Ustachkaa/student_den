import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/handy_work_model.dart';

part 'handy_work_state.dart';
part 'handy_work_event.dart';


/// A bloc that manages the state of a HandyWorkCategory according to the event that is dispatched to it.
class HandyWorkCategoryBloc extends Bloc<HandyWorkEvent, HandyWorkState> {
  HandyWorkCategoryBloc(HandyWorkState initialState) : super(initialState) {
    on<HandyWorkInitialEvent>(_onInitialize);
  }

  _onInitialize(
      HandyWorkInitialEvent event,
      Emitter<HandyWorkState> emit,
      ) async {
    // No longer need to emit grid items here
  }
}