import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/job_category_model.dart';
part 'job_category_event.dart';
part 'job_category_state.dart';

/// A bloc that manages the state of a JobCategory according to the event that is dispatched to it.
class JobCategoryBloc extends Bloc<JobCategoryEvent, JobCategoryState> {
  JobCategoryBloc(JobCategoryState initialState)
      : super(initialState) {
    on<JobCategoryInitialEvent>(_onInitialize);
  }

  _onInitialize(
      JobCategoryInitialEvent event,
      Emitter<JobCategoryState> emit,
      ) async {
    // No longer need to emit grid items here
  }
}