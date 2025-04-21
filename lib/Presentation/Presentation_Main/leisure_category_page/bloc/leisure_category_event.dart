part of 'leisure_category_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// LeisureCategory widget.
///
/// Events must be immutable and implement the [Equatable] interface.
abstract class LeisureCategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the LeisureCategory widget is first created.
class LeisureCategoryInitialEvent extends LeisureCategoryEvent {
  @override
  List<Object?> get props => [];
}
