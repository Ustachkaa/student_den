import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/leisure_category_model.dart';
part 'leisure_category_event.dart';
part 'leisure_category_state.dart';

/// A bloc that manages the state of a LeisureCategory according to the event that is dispatched to it.
class LeisureCategoryBloc extends Bloc<LeisureCategoryEvent, LeisureCategoryState> {
  LeisureCategoryBloc(LeisureCategoryState initialState)
      : super(initialState) {
    on<LeisureCategoryInitialEvent>(_onInitialize);
  }

  _onInitialize(
      LeisureCategoryInitialEvent event,
      Emitter<LeisureCategoryState> emit,
      ) async {
    // No longer need to emit grid items here
  }
}