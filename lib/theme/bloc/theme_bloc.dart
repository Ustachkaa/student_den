import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/app_export.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(ThemeState themeState) : super(ThemeState(themeType: ThemeHelper().defaultTheme)) {
    on<ThemeChangeEvent>(_changeTheme);
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeType = prefs.getString('themeType') ?? ThemeHelper().defaultTheme;
    emit(state.copyWith(themeType: themeType));
  }

  Future<void> _changeTheme(
      ThemeChangeEvent event, Emitter<ThemeState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeType', event.themeType);
    emit(state.copyWith(themeType: event.themeType));
  }
}
