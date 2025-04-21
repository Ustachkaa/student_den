part of 'news_category_bloc.dart';

/// Represents the state of NewsCategory in the application.

// ignore_for_file: must_be_immutable
class NewsCategoryState extends Equatable {
  NewsCategoryState({this.newsCategoryModelObj});

  NewsCategoryModel? newsCategoryModelObj;

  @override
  List<Object?> get props => [newsCategoryModelObj];

}