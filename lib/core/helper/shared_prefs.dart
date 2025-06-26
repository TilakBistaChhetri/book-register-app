import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static Future<SharedPreferences> get _prefs async =>  await SharedPreferences.getInstance();

  static Future<void> saveString(String key, String value) async {
    final prefs = await _prefs;
    await prefs.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }
}