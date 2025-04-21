part of 'student_registration_screen_bloc.dart';

/// Implemented the Abstract Class with Sealed
sealed class StudentRegistrationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/// To implements the initial stage
class StudentRegistrationInitialEvent extends StudentRegistrationEvent {}

/// Action to make it change update
class UpdateInterestChipEvent extends StudentRegistrationEvent {
  /// Set of index to select the object
  final int index;

  /// Check the selection
  final bool isSelected;

  /// Get the properties from it
  UpdateInterestChipEvent({
    required this.index,
    required this.isSelected
  });

  @override
  List<Object> get props => [index, isSelected];
}

class RegisterStudent extends StudentRegistrationEvent {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  final String university;
  final String studentId;
  final String yearOfStudy;
  final String city;
  final String address;
  final List<String> interests;

  RegisterStudent({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.university,
    required this.studentId,
    required this.yearOfStudy,
    required this.city,
    required this.address,
    required this.interests,
  });

  @override
  List<Object> get props => [fullName, email, phoneNumber, password, university, studentId, yearOfStudy, city, address, interests];
}
