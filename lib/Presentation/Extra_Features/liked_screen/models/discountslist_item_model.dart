import 'package:equatable/equatable.dart';
import '../../../../core/app_export.dart';

/// This class is used in the [discountslist_item_widget] screen.

// ignore_for_file: must_be_immutable
class DiscountslistItemModel extends Equatable {
  DiscountslistItemModel({
    this.cafbeanland,
    this.off,
    this.fortyFive,
    this.id}) {
    cafbeanland = cafbeanland ?? "lbl_studyspace".tr;
    off = off ?? "msg_buy_1_get_1_free".tr;
    fortyFive = fortyFive ?? "lbl_4_7".tr;
    id = id ?? "";
  }

  String? cafbeanland;

  String? off;

  String? fortyFive;

  String? id;

  DiscountslistItemModel copyWith({
    String? cafbeanland,
    String? off,
    String? fortyFive,
    String? id,
  }) {
    return DiscountslistItemModel(
      cafbeanland: cafbeanland ?? this.cafbeanland,
      off: off ?? this.off,
      fortyFive: fortyFive ?? this.fortyFive,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [cafbeanland, off, fortyFive, id];
}
