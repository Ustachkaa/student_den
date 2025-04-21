part of 'theme_bloc.dart';

/// Represents the state of the theme in the application.
/// The state includes the current theme type.
class ThemeState extends Equatable {
  /// Creates a [ThemeState] with the given [themeType].
  const ThemeState({required this.themeType});

  /// The current theme type.
  final String themeType;

  @override
  List<Object?> get props => [themeType];

  /// Creates a copy of this [ThemeState] with the given fields
  ThemeState copyWith({String? themeType}) {
    return ThemeState(
      themeType: themeType ?? this.themeType,
    );
  }
}
