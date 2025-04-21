import 'package:shared_preferences/shared_preferences.dart';

// Singleton class to handle SharedPreferences operations
class PrefUtils {
  static final PrefUtils _instance = PrefUtils._internal();

  factory PrefUtils() {
    return _instance;
  }

  PrefUtils._internal(); // Named constructor for the singleton

  SharedPreferences? _sharedPreferences;

  // Initialize shared preferences
  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  // Get theme data from shared preferences
  String getThemeData() {
    try {
      return _sharedPreferences?.getString('theme') ?? 'light';
    } catch (e) {
      return 'light';
    }
  }

  // Set theme data in shared preferences
  Future<void> setThemeData(String themeType) async {
    await _sharedPreferences?.setString('theme', themeType);
  }
}