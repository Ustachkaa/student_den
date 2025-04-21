part of 'settings_bloc.dart';

/// Represents the state of Settings in the application.

// ignore_for_file: must_be_immutable
class SettingsState extends Equatable {
  SettingsState({
    this.searchthreeController,
    this.settingsModelObj,
  });

  TextEditingController? searchthreeController;

  SettingsModel? settingsModelObj;

  @override
  List<Object?> get props => [searchthreeController, settingsModelObj];

  SettingsState copyWith({
    TextEditingController? searchthreeController,
    SettingsModel? settingsModelObj,
  }) {
    return SettingsState(
      searchthreeController: searchthreeController ?? this.searchthreeController,
      settingsModelObj: settingsModelObj ?? this.settingsModelObj,
    );
  }
}
