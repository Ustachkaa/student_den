part of 'pre_login_screen_bloc.dart';

/// Represents the state of PreLoginScreen in the application.
sealed class PreLoginScreenState extends Equatable {
  /// Constructor to implement its instances
  const PreLoginScreenState({this.preLoginScreenModelObj});

  /// Model to call in State
  final PreLoginScreenModel? preLoginScreenModelObj;

  @override
  List<Object?> get props => [preLoginScreenModelObj];

  /// Function that returns a new state class
  PreLoginScreenState copyWith({
    PreLoginScreenModel? preLoginScreenModelObj,
  }) {
    return PreLoginScreenInitial(
      preLoginScreenModelObj:
      preLoginScreenModelObj ?? this.preLoginScreenModelObj,
    );
  }
}

/// Initial state of PreLoginScreen
class PreLoginScreenInitial extends PreLoginScreenState {
  const PreLoginScreenInitial({PreLoginScreenModel? preLoginScreenModelObj})
      : super(preLoginScreenModelObj: preLoginScreenModelObj);
}