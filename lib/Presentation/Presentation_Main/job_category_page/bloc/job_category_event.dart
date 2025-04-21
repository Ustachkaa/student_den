part of 'job_category_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// JobCategory widget.
///
/// Events must be immutable and implement the [Equatable] interface.
abstract class JobCategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the JobCategory widget is first created.
class JobCategoryInitialEvent extends JobCategoryEvent {
  @override
  List<Object?> get props => [];
}
