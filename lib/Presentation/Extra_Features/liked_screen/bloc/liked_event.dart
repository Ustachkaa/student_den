part of 'liked_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Liked widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class LikedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Liked widget is first created.
class LikedInitialEvent extends LikedEvent {
  @override
  List<Object?> get props => [];
}
