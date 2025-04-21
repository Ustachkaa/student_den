part of 'handy_work_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// HandyWork widget.
abstract class HandyWorkEvent extends Equatable {
  const HandyWorkEvent();

  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the HandyWork widget is first created.
class HandyWorkInitialEvent extends HandyWorkEvent {
  @override
  List<Object?> get props => [];
}
