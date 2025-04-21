part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ThemeChangeEvent extends ThemeEvent {
  ThemeChangeEvent({required this.themeType});

  final String themeType;

  @override
  List<Object?> get props => [themeType];
}
