import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/app_export.dart';

part 'filter_event.dart';
part 'filter_state.dart';

/// A bloc that manages the state of a Filter according to the event that is dispatched to it.
class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterState()) {
    on<FilterInitialEvent>(_onInitialize);
    on<ChangeRadioButtonEvent>(_changeRadioButton);
    on<ChangeRadioButton1Event>(_changeRadioButton1);
    on<ChangeRadioButton2Event>(_changeRadioButton2);
    on<ChangeRadioButton3Event>(_changeRadioButton3);
    on<ChangeRadioButton4Event>(_changeRadioButton4);
    on<ChangeRadioButton5Event>(_changeRadioButton5);
  }

  void _onInitialize(FilterInitialEvent event, Emitter<FilterState> emit) {
    emit(
      state.copyWith(
        radioGroup: "",
        radioGroup1: "",
        radioGroup2: "",
        radioGroup3: "",
        sortOptions: "",
        timePreferences: "",
      ),
    );
  }

  void _changeRadioButton(ChangeRadioButtonEvent event, Emitter<FilterState> emit) {
    emit(state.copyWith(radioGroup: event.value));
  }

  void _changeRadioButton1(ChangeRadioButton1Event event, Emitter<FilterState> emit) {
    emit(state.copyWith(radioGroup1: event.value));
  }

  void _changeRadioButton2(ChangeRadioButton2Event event, Emitter<FilterState> emit) {
    emit(state.copyWith(radioGroup2: event.value));
  }

  void _changeRadioButton3(ChangeRadioButton3Event event, Emitter<FilterState> emit) {
    emit(state.copyWith(radioGroup3: event.value));
  }

  void _changeRadioButton4(ChangeRadioButton4Event event, Emitter<FilterState> emit) {
    emit(state.copyWith(sortOptions: event.value));
  }

  void _changeRadioButton5(ChangeRadioButton5Event event, Emitter<FilterState> emit) {
    emit(state.copyWith(timePreferences: event.value));
  }
}