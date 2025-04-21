// person_event.dart
part of 'person_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Person widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class PersonEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Person widget is first created.
class PersonInitialEvent extends PersonEvent {
  @override
  List<Object?> get props => [];
}

//Event for changing ChipView selection

// ignore_for_file: must_be_immutable
class UpdateChipViewEvent extends PersonEvent {
  UpdateChipViewEvent({required this.index, this.isSelected});

  int index;

  bool? isSelected;

  @override
  List<Object?> get props => [index, isSelected];
}
