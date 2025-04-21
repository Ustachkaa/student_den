import 'package:equatable/equatable.dart';
import 'package:student_den/core/app_export.dart';

/// Model for interest chip items in student registration
class InterestChipModel extends Equatable {
  /// Return the properties
  InterestChipModel({
    String? interestName,
    this.isSelected = false,
  }) : interestName = interestName ?? "lbl_food".tr;

  /// Getting properties of the screen
  final String? interestName;

  /// Get when selected
  final bool isSelected;

  /// Copy all the parameters here
  InterestChipModel copyWith({
    String? interestName,
    bool? isSelected,
  }) {
    return InterestChipModel(
      interestName: interestName ?? this.interestName,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object> get props => [interestName ?? '', isSelected];
}
