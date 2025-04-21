part of 'handy_work_bloc.dart';


/// Represents the state of HandyWorkCategory in the application.

// ignore_for_file: must_be_immutable
class HandyWorkState extends Equatable {
  HandyWorkState({this.handyWorkCategoryModelObj});

  HandyWorkCategoryModel? handyWorkCategoryModelObj;

  @override
  List<Object?> get props => [handyWorkCategoryModelObj];

}