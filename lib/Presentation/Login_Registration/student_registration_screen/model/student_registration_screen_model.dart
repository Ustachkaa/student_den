import 'package:equatable/equatable.dart';
import 'package:student_den/core/app_export.dart';
import 'package:student_den/data/models/selectionPopupModel/selection_popup_model.dart';
import 'interest_chip_model.dart';

/// Implemented all the function related to Model for screen
class StudentRegistrationModel extends Equatable {
  /// Get list of all university
  final List<SelectionPopupModel> universityList;

  /// To get list of all chip in the application
  final List<InterestChipModel> interestChipList;

  /// Calling all from here
  const StudentRegistrationModel({
    this.universityList = const [],
    this.interestChipList = const [],
  });

  /// Copy function for Model
  StudentRegistrationModel copyWith({
    List<SelectionPopupModel>? universityList,
    List<InterestChipModel>? interestChipList,
  }) {
    return StudentRegistrationModel(
      universityList: universityList ?? this.universityList,
      interestChipList: interestChipList ?? this.interestChipList,
    );
  }

  @override
  List<Object?> get props => [universityList, interestChipList];
}
