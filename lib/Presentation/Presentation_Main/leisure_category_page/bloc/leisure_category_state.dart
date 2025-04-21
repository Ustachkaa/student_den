part of 'leisure_category_bloc.dart';

/// Represents the state of LeisureCategory in the application.

// ignore_for_file: must_be_immutable
class LeisureCategoryState extends Equatable {
  LeisureCategoryState({this.leisureCategoryModelObj});

  LeisureCategoryModel? leisureCategoryModelObj;

  @override
  List<Object?> get props => [leisureCategoryModelObj];

}