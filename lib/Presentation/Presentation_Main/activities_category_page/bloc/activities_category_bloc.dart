import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart'; // Import for TextEditingController
import 'package:student_den/core/app_export.dart';
import '../models/activities_category_model.dart';

part 'activities_category_event.dart';
part 'activities_category_state.dart';

/// A bloc that manages the state of Activities Category according to the event that is dispatched to it.
class ActivitiesCategoryBloc extends Bloc<ActivitiesCategoryEvent, ActivitiesCategoryState> {
  ActivitiesCategoryBloc(ActivitiesCategoryState initialState) : super(initialState) {
    on<ActivitiesCategoryInitialEvent>(_onInitialize);
    on<CategorySelected>(_onCategorySelected);
  }

  _onInitialize(
      ActivitiesCategoryInitialEvent event,
      Emitter<ActivitiesCategoryState> emit,
      ) async {
    // No longer need to emit grid items here
  }

  void _onCategorySelected(CategorySelected event, Emitter<ActivitiesCategoryState> emit) {
    emit(state.copyWith(selectedCategory: event.category));
  }
}