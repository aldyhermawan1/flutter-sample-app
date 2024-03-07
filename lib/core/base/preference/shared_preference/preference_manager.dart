abstract class PreferenceManager {
  Future saveString({required String key, required String value});

  Future saveStringList({required String key, required List<String>value});

  Future saveInt({required String key, required int value});

  Future saveDouble({required String key, required double value});

  Future saveBool({required String key, required bool value});

  String? getString({required String key});

  List<String>? getStringList({required String key});

  int? getInt({required String key});

  bool? getBool({required String key});

  double? getDouble({required String key});

  Future removeValue({required String key});

  Future clear();

  Future reload();
}
