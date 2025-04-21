import 'package:equatable/equatable.dart';
import '../../../../core/app_export.dart';

/// This class is used in the [chipviewdigital_item_widget] screen.

// ignore_for_file: must_be_immutable
class ChipviewdigitalItemModel extends Equatable {
  ChipviewdigitalItemModel({this.digitalArts, this.isSelected}) {
    digitalArts = digitalArts ?? "lbl_digital_arts".tr;
    isSelected = isSelected ?? false;
  }

  String? digitalArts;

  bool? isSelected;

  ChipviewdigitalItemModel copyWith({
    String? digitalArts,
    bool? isSelected,
  }) {
    return ChipviewdigitalItemModel(
      digitalArts: digitalArts ?? this.digitalArts,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [digitalArts, isSelected];
}