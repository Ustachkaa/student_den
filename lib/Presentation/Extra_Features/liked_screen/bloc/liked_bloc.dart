import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/app_export.dart';
import '../models/discountslist_item_model.dart';
import '../models/liked_model.dart';
part 'liked_event.dart';
part 'liked_state.dart';

/// A bloc that manages the state of a Liked according to the event that is dispatched to it.
class LikedBloc extends Bloc<LikedEvent, LikedState> {
  LikedBloc(LikedState initialState) : super(initialState) {
    on<LikedInitialEvent>(_onInitialize);
  }

  _onInitialize(
      LikedInitialEvent event,
      Emitter<LikedState> emit,
      ) async {
    emit(
      state.copyWith(
        searchtwoController: TextEditingController(),
      ),
    );
    emit(
      state.copyWith(
        likedModelObj: state.likedModelObj?.copyWith(
          discountslistItemList: fillDiscountslistItemList(),
        ),
      ),
    );
  }

  List<DiscountslistItemModel> fillDiscountslistItemList() {
    return [
      DiscountslistItemModel(
          cafbeanland: "lbl_studyspace".tr,
          off: "msg_buy_1_get_1_free".tr,
          fortyFive: "lbl_4_7".tr),
      DiscountslistItemModel()
    ];
  }
}
