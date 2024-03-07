abstract class SecurePreferenceManager {
  Future saveString({required String key, required String value});

  Future saveInt({required String key, required int value});

  Future saveBool({required String key, required bool value});

  Future saveDouble({required String key, required double value});

  Future<String?> getString({required String key});

  Future<bool?> getBool({required String key});

  Future<int?> getInt({required String key});

  Future<double?> getDouble({required String key});

  Future removeValue({required String key});

  Future clear();
}
