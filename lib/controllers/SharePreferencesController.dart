import 'package:shared_preferences/shared_preferences.dart';

class SharePreferencesController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _language = "_keyLanguage";


  //**************************************************************
  Future<bool> setInt(String key, int value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setInt(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(key, value);
  }

  Future<int> getInt(String key, int defaultValue) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt(key) ?? defaultValue;
  }

  Future<bool> getBool(String key, bool defaultValue) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool(key) ?? defaultValue;
  }

  Future<String> getString(String key, String defaultValue) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key) ?? defaultValue;
  }

//*****************************************************************

  Future<String> getLanguage() async {
    return await getString(_language, "fa");
  }

  Future<bool> setLanguage(String value) async {
    return await setString(_language, value);
  }

}
