part of 'person_bloc.dart';

/// Represents the state of Person in the application.

// ignore_for_file: must_be_immutable
class PersonState extends Equatable {
  PersonState({
    this.searcheightController,
    this.fullNameController,
    this.emailController,
    this.phoneController,
    this.dateController,
    this.checkmarkoneController,
    this.searchfiveController,
    this.personModelObj});

  TextEditingController? searcheightController;

  TextEditingController? fullNameController;

  TextEditingController? emailController;

  TextEditingController? phoneController;

  TextEditingController? dateController;

  TextEditingController? checkmarkoneController;

  TextEditingController? searchfiveController;

  PersonModel? personModelObj;

  @override
  List<Object?> get props => [
    searcheightController,
    fullNameController,
    emailController,
    phoneController,
    dateController,
    checkmarkoneController,
    searchfiveController,
    personModelObj
  ];

  PersonState copyWith({
    TextEditingController? searcheightController,
    TextEditingController? fullNameController,
    TextEditingController? emailController,
    TextEditingController? phoneController,
    TextEditingController? dateController,
    TextEditingController? checkmarkoneController,
    TextEditingController? searchfiveController,
    PersonModel? personModelObj,
  }) {
    return PersonState(
      searcheightController:
      searcheightController ?? this.searcheightController,
      fullNameController: fullNameController ?? this.fullNameController,
      emailController: emailController ?? this.emailController,
      phoneController: phoneController ?? this.phoneController,
      dateController: dateController ?? this.dateController,
      checkmarkoneController:
      checkmarkoneController ?? this.checkmarkoneController,
      searchfiveController: searchfiveController ?? this.searchfiveController,
      personModelObj: personModelObj ?? this.personModelObj,
    );
  }
}