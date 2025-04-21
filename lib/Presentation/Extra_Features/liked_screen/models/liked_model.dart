import 'package:equatable/equatable.dart';
import 'discountslist_item_model.dart';

/// This class defines the variables used in the [liked_screen],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class LikedModel extends Equatable {
  LikedModel({this.discountslistItemList = const []});

  List<DiscountslistItemModel> discountslistItemList;

  LikedModel copyWith({List<DiscountslistItemModel>? discountslistItemList}) {
    return LikedModel(
      discountslistItemList:
      discountslistItemList ?? this.discountslistItemList,
    );
  }

  @override
  List<Object?> get props => [discountslistItemList];
}
