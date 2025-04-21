import 'package:equatable/equatable.dart';
import '../../../../core/app_export.dart';

/// This class defines the variables used in the [pre_login_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PreLoginScreenModel extends Equatable {
  /// To access the model in State
  const PreLoginScreenModel();

  /// Return the class with properties
  PreLoginScreenModel copyWith() {
    return const PreLoginScreenModel();
  }

  @override
  List<Object> get props => [];
}
