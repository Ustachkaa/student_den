part of 'news_category_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// NewsCategory widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class NewsCategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the NewsCategory widget is first created.
class NewsCategoryInitialEvent extends NewsCategoryEvent {
  @override
  List<Object?> get props => [];
}
