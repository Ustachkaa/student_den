part of 'job_category_bloc.dart';

/// Represents the state of JobCategory in the application.

// ignore_for_file: must_be_immutable
class JobCategoryState extends Equatable {
  JobCategoryState({this.jobCategoryModelObj});

  JobCategoryModel? jobCategoryModelObj;

  @override
  List<Object?> get props => [jobCategoryModelObj];

}