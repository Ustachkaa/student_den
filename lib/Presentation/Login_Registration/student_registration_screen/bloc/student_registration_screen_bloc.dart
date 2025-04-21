import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_den/core/app_export.dart';
import 'package:student_den/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:student_den/Presentation/Login_Registration/student_registration_screen/model/interest_chip_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/student_registration_screen_model.dart';
part 'student_registration_screen_event.dart';
part 'student_registration_screen_state.dart';

/// A BLoC that manages the state of the StudentRegistrationScreen.
class StudentRegistrationBloc extends Bloc<StudentRegistrationEvent, StudentRegistrationState> {
  /// Initializes the [StudentRegistrationBloc] with the given initial state.
  StudentRegistrationBloc(StudentRegistrationState initialState) : super(initialState) {
    on<StudentRegistrationInitialEvent>(_onInitialize);
    on<UpdateInterestChipEvent>(_updateInterestChip);
    on<RegisterStudent>(_registerStudent); // Implement method
  }

  /// Handles the [StudentRegistrationInitialEvent].
  Future<void> _onInitialize(
      StudentRegistrationInitialEvent event,
      Emitter<StudentRegistrationState> emit,
      ) async {
    emit(state.copyWith(
      fullNameController: TextEditingController(),
      emailController: TextEditingController(),
      phoneController: TextEditingController(),
      passwordController: TextEditingController(),
      confirmPasswordController: TextEditingController(),
      universityController: TextEditingController(),
      studentIdController: TextEditingController(),
      yearController: TextEditingController(),
      cityController: TextEditingController(),
      addressController: TextEditingController(),
    ));

    emit(state.copyWith(
      studentRegistrationModelObj: state.studentRegistrationModelObj?.copyWith(
        universityList: _fillUniversityList(),
        interestChipList: _fillInterestChips(),
      ),
    ));
  }

  /// Handles the [UpdateInterestChipEvent].
  void _updateInterestChip(
      UpdateInterestChipEvent event,
      Emitter<StudentRegistrationState> emit,
      ) {
    final newList = List<InterestChipModel>.from(
        state.studentRegistrationModelObj?.interestChipList ?? []
    );
    newList[event.index] = newList[event.index].copyWith(
      isSelected: event.isSelected,
    );

    emit(state.copyWith(
      studentRegistrationModelObj: state.studentRegistrationModelObj?.copyWith(
          interestChipList: newList
      ),
    ));
  }

  /// New Firebase Method for all
  Future<void> _registerStudent(RegisterStudent event, Emitter<StudentRegistrationState> emit) async {
    emit(state.copyWith(registrationStatus: RegistrationStatus.loading));
    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      if (userCredential.user != null) {
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'fullName': event.fullName,
          'phoneNumber': event.phoneNumber,
          'university': event.university,
          'studentId': event.studentId,
          'yearOfStudy': event.yearOfStudy,
          'city': event.city,
          'address': event.address,
          'interests': event.interests,
        });
        emit(state.copyWith(registrationStatus: RegistrationStatus.success));
      } else {
        emit(state.copyWith(registrationStatus: RegistrationStatus.failure, errorMessage: 'Failed to create user.'));
      }
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(registrationStatus: RegistrationStatus.failure, errorMessage: e.message));
    } catch (e) {
      emit(state.copyWith(registrationStatus: RegistrationStatus.failure, errorMessage: 'An unexpected error occurred.'));
    }
  }

  /// Function for list of university
  List<SelectionPopupModel> _fillUniversityList() {
    return [
      SelectionPopupModel(id: 1, title: "Tbilisi State University", isSelected: true),
      SelectionPopupModel(id: 2, title: "Ilia State University"),
      SelectionPopupModel(id: 3, title: "Free University of Tbilisi"),
    ];
  }

  /// Function for intrests
  List<InterestChipModel> _fillInterestChips() {
    return [
      InterestChipModel(interestName: "lbl_travel".tr),
      InterestChipModel(interestName: "lbl_entertainment".tr),
      InterestChipModel(interestName: "lbl_books".tr),
      InterestChipModel(interestName: "lbl_news".tr),
      InterestChipModel(interestName: "lbl_sports".tr),
    ];
  }
}
