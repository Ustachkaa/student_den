import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/discount_category_model.dart';
part 'discount_category_event.dart';
part 'discount_category_state.dart';

/// A bloc that manages the state of a DiscountCategory according to the event that is dispatched to it.
class DiscountCategoryBloc extends Bloc<DiscountCategoryEvent, DiscountCategoryState> {
  DiscountCategoryBloc(DiscountCategoryState initialState)
      : super(initialState) {
    on<DiscountCategoryInitialEvent>(_onInitialize);
  }

  _onInitialize(
      DiscountCategoryInitialEvent event,
      Emitter<DiscountCategoryState> emit,
      ) async {
    // No longer need to emit grid items here
  }
}