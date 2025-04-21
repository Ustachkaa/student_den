part of 'student_registration_screen_bloc.dart';

/// Represents the state of StudentRegistration in the application.
class StudentRegistrationState extends Equatable {
  /// To construct and call the initial stage
  const StudentRegistrationState({
    this.fullNameController,
    this.emailController,
    this.phoneController,
    this.passwordController,
    this.confirmPasswordController,
    this.universityController,
    this.studentIdController,
    this.yearController,
    this.cityController,
    this.addressController,
    this.selectedLanguage,
    this.studentRegistrationModelObj,
    this.registrationStatus = RegistrationStatus.initial,
    this.errorMessage,
  });

  /// Set full name on field
  final TextEditingController? fullNameController;

  /// Set email on field
  final TextEditingController? emailController;

  /// Set phone number on field
  final TextEditingController? phoneController;

  /// Set password on field
  final TextEditingController? passwordController;

  /// Set confirmation password on field
  final TextEditingController? confirmPasswordController;

  /// Set Unversity Controller
  final TextEditingController? universityController;

  /// Set id number here
  final TextEditingController? studentIdController;

  /// Set year
  final TextEditingController? yearController;

  /// Set city values
  final TextEditingController? cityController;

  /// Set address values
  final TextEditingController? addressController;

  /// Select the language
  final SelectionPopupModel? selectedLanguage;

  /// Check student registration Model
  final StudentRegistrationModel? studentRegistrationModelObj;

  /// Check status if Registration
  final RegistrationStatus registrationStatus;

  /// Error message appear
  final String? errorMessage;

  @override
  List<Object?> get props => [
    fullNameController,
    emailController,
    phoneController,
    passwordController,
    confirmPasswordController,
    universityController,
    studentIdController,
    yearController,
    cityController,
    addressController,
    selectedLanguage,
    studentRegistrationModelObj,
    registrationStatus,
    errorMessage,
  ];

  /// To copy all the properties of the state
  StudentRegistrationState copyWith({
    TextEditingController? fullNameController,
    TextEditingController? emailController,
    TextEditingController? phoneController,
    TextEditingController? passwordController,
    TextEditingController? confirmPasswordController,
    TextEditingController? universityController,
    TextEditingController? studentIdController,
    TextEditingController? yearController,
    TextEditingController? cityController,
    TextEditingController? addressController,
    SelectionPopupModel? selectedLanguage,
    StudentRegistrationModel? studentRegistrationModelObj,
    RegistrationStatus? registrationStatus,
    String? errorMessage,
  }) {
    return StudentRegistrationState(
      fullNameController: fullNameController ?? this.fullNameController,
      emailController: emailController ?? this.emailController,
      phoneController: phoneController ?? this.phoneController,
      passwordController: passwordController ?? this.passwordController,
      confirmPasswordController: confirmPasswordController ?? this.confirmPasswordController,
      universityController: universityController ?? this.universityController,
      studentIdController: studentIdController ?? this.studentIdController,
      yearController: yearController ?? this.yearController,
      cityController: cityController ?? this.cityController,
      addressController: addressController ?? this.addressController,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      studentRegistrationModelObj: studentRegistrationModelObj ?? this.studentRegistrationModelObj,
      registrationStatus: registrationStatus ?? this.registrationStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// Function that helps to implement all registration on the screen
enum RegistrationStatus { initial, loading, success, failure }
