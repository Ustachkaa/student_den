// person_bloc.dart
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/app_export.dart';
import '../models/chipviewdigital_item_model.dart';
import '../models/person_model.dart';
part 'person_event.dart';
part 'person_state.dart';

/// A bloc that manages the state of a Person according to the event that is dispatched to it.
class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc(PersonState initialstate) : super(initialstate) {
    on<PersonInitialEvent>(_onInitialize);
    on<UpdateChipViewEvent>(_updateChipView);
  }

  _onInitialize(
      PersonInitialEvent event,
      Emitter<PersonState> emit,
      ) async {
    emit(
      state.copyWith(
        searcheightController: TextEditingController(),
        fullNameController: TextEditingController(),
        emailController: TextEditingController(),
        phoneController: TextEditingController(),
        dateController: TextEditingController(),
        checkmarkoneController: TextEditingController(),
        searchfiveController: TextEditingController(),
      ),
    );
    emit(
      state.copyWith(
        personModelObj: state.personModelObj?.copyWith(
          chipviewdigitalItemList: fillChipviewdigitalItemList(),
        ),
      ),
    );
  }

  _updateChipView(
      UpdateChipViewEvent event,
      Emitter<PersonState> emit,
      ) {
    List<ChipviewdigitalItemModel> newList =
    List<ChipviewdigitalItemModel>.from(
        state.personModelObj!.chipviewdigitalItemList);
    newList[event.index] = newList[event.index].copyWith(
      isSelected: event.isSelected,
    );
    emit(
      state.copyWith(
        personModelObj:
        state.personModelObj?.copyWith(chipviewdigitalItemList: newList),
      ),
    );
  }

  List<ChipviewdigitalItemModel> fillChipviewdigitalItemList() {
    return [
      ChipviewdigitalItemModel(digitalArts: "lbl_digital_arts".tr),
      ChipviewdigitalItemModel(digitalArts: "msg_student_discounts".tr),
      ChipviewdigitalItemModel(digitalArts: "msg_jobs_internships".tr),
      ChipviewdigitalItemModel(digitalArts: "lbl".tr)
    ];
  }
}
