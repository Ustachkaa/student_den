part of 'pre_login_screen_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// PreLoginScreen widget.
///
/// Events must be immutable and implement the [Equatable] interface.
sealed class PreLoginScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/// Event that is dispatched when the PreLoginScreen widget is first created.
class PreLoginScreenInitialEvent extends PreLoginScreenEvent {
  @override
  List<Object> get props => [];
}
