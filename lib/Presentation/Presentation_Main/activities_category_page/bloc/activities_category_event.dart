part of 'activities_category_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// ActivitiesCategory widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class ActivitiesCategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the ActivitiesCategory widget is first created.
class ActivitiesCategoryInitialEvent extends ActivitiesCategoryEvent {
  @override
  List<Object?> get props => [];
}

class CategorySelected extends ActivitiesCategoryEvent {
  final String category;

  CategorySelected({required this.category});

  @override
  List<Object?> get props => [category];
}