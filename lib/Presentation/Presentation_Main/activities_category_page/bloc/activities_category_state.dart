part of 'activities_category_bloc.dart';

/// Represents the state of ActivitiesCategory in the application.
// ignore_for_file: must_be_immutable
class ActivitiesCategoryState extends Equatable {
  ActivitiesCategoryState({
    this.searchController,
    this.activitiesCategoryModelObj,
    this.selectedCategory = '',
  });

  TextEditingController? searchController;
  ActivitiesCategoryModel? activitiesCategoryModelObj;
  String selectedCategory;

  @override
  List<Object?> get props => [
    searchController,
    activitiesCategoryModelObj,
    selectedCategory,
  ];

  ActivitiesCategoryState copyWith({
    TextEditingController? searchController,
    ActivitiesCategoryModel? activitiesCategoryModelObj,
    String? selectedCategory,
  }) {
    return ActivitiesCategoryState(
      searchController: searchController ?? this.searchController,
      activitiesCategoryModelObj:
      activitiesCategoryModelObj ?? this.activitiesCategoryModelObj,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}