import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/news_category_model.dart';
part 'news_category_event.dart';
part 'news_category_state.dart';

/// A bloc that manages the state of a NewsCategory according to the event that is dispatched to it.
class NewsCategoryBloc extends Bloc<NewsCategoryEvent, NewsCategoryState> {
  NewsCategoryBloc(NewsCategoryState initialState)
      : super(initialState) {
    on<NewsCategoryInitialEvent>(_onInitialize);
  }

  _onInitialize(
      NewsCategoryInitialEvent event,
      Emitter<NewsCategoryState> emit,
      ) async {
    // No longer need to emit grid items here
  }
}