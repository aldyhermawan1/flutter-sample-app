import 'package:shared_preferences/shared_preferences.dart';

import 'preference_manager.dart';

class PreferenceManagerImplementation implements PreferenceManager {
  final SharedPreferences _preferences;

  PreferenceManagerImplementation(this._preferences);

  @override
  Future saveBool({required String key, required bool value}) {
    return _preferences.setBool(key, value);
  }

  @override
  Future saveDouble({required String key, required double value}) {
    return _preferences.setDouble(key, value);
  }

  @override
  Future saveInt({required String key, required int value}) {
    return _preferences.setInt(key, value);
  }

  @override
  Future saveString({required String key, required String value}) {
    return _preferences.setString(key, value);
  }

  @override
  Future saveStringList({required String key, required List<String> value}) {
    return _preferences.setStringList(key, value);
  }

  @override
  bool? getBool({required String key}) {
    bool? boolValue = _preferences.getBool(key);
    return boolValue;
  }

  @override
  double? getDouble({required String key}) {
    double? doubleValue = _preferences.getDouble(key);
    return doubleValue;
  }

  @override
  int? getInt({required String key}) {
    int? intValue = _preferences.getInt(key);
    return intValue;
  }

  @override
  String? getString({required String key}) {
    String? stringValue = _preferences.getString(key);
    return stringValue;
  }

  @override
  List<String>? getStringList({required String key}) {
    List<String>? stringListValue = _preferences.getStringList(key);
    return stringListValue;
  }

  @override
  Future reload() {
    return _preferences.reload();
  }

  @override
  Future clear() {
    return _preferences.clear();
  }

  @override
  Future removeValue({required String key}) {
    return _preferences.remove(key);
  }
}
