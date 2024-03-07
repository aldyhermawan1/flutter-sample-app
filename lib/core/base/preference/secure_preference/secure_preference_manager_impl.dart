import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'secure_preference_manager.dart';

class SecurePreferenceManagerImplementation implements SecurePreferenceManager {
  final FlutterSecureStorage _flutterSecureStorage;

  SecurePreferenceManagerImplementation(this._flutterSecureStorage);

  @override
  Future saveInt({required String key, required int value}) {
    return _flutterSecureStorage.write(key: key, value: value.toString());
  }

  @override
  Future saveString({required String key, required String value}) {
    return _flutterSecureStorage.write(key: key, value: value);
  }

  @override
  Future<void> saveBool({required String key, required bool value}) {
    return _flutterSecureStorage.write(key: key, value: value ? '1' : '0');
  }

  @override
  Future saveDouble({required String key, required double value}) {
    return _flutterSecureStorage.write(key: key, value: value.toString());
  }

  @override
  Future clear() {
    return _flutterSecureStorage.deleteAll();
  }

  @override
  Future removeValue({required String key}) {
    return _flutterSecureStorage.delete(key: key);
  }

  @override
  Future<int?> getInt({required String key}) async {
    String? value = await _flutterSecureStorage.read(key: key);
    int? returnValue;
    try {
      if (value != null) returnValue = int.parse(value);
    } catch (error) {
      returnValue = null;
    }
    return returnValue;
  }

  @override
  Future<String?> getString({required String key}) async {
    String? value = await _flutterSecureStorage.read(key: key);
    return value;
  }

  @override
  Future<bool?> getBool({required String key}) async {
    String? value = await _flutterSecureStorage.read(key: key);
    return value == '1';
  }

  @override
  Future<double?> getDouble({required String key}) async {
    String? value = await _flutterSecureStorage.read(key: key);
    double? returnValue;
    try {
      if (value != null) returnValue = double.parse(value);
    } catch (error) {
      returnValue = null;
    }
    return returnValue;
  }
}
