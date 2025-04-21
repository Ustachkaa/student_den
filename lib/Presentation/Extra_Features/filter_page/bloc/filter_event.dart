part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object?> get props => [];
}

class FilterInitialEvent extends FilterEvent {}

class ChangeRadioButtonEvent extends FilterEvent {
  final String value;

  const ChangeRadioButtonEvent({required this.value});

  @override
  List<Object?> get props => [value];
}

class ChangeRadioButton1Event extends FilterEvent {
  final String value;

  const ChangeRadioButton1Event({required this.value});

  @override
  List<Object?> get props => [value];
}

class ChangeRadioButton2Event extends FilterEvent {
  final String value;

  const ChangeRadioButton2Event({required this.value});

  @override
  List<Object?> get props => [value];
}

class ChangeRadioButton3Event extends FilterEvent {
  final String value;

  const ChangeRadioButton3Event({required this.value});

  @override
  List<Object?> get props => [value];
}

class ChangeRadioButton4Event extends FilterEvent {
  final String value;

  const ChangeRadioButton4Event({required this.value});

  @override
  List<Object?> get props => [value];
}

class ChangeRadioButton5Event extends FilterEvent {
  final String value;

  const ChangeRadioButton5Event({required this.value});

  @override
  List<Object?> get props => [value];
}