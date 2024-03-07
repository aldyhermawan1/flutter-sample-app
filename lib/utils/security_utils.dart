import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:sample/utils/constants/app_constants.dart';

class SecurityUtils {
  static const String storageKey = 'storage_key';

  static getSecureStorage(String name) {
    return FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
        sharedPreferencesName: name,
        storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
      ),
    );
  }

  static Future<String> initEncryptionKey() async {
    var secureStorage = getSecureStorage(AppConstants.dbName);
    var key = await secureStorage.read(key: storageKey);
    if (key == null) {
      var hiveKey = Hive.generateSecureKey();
      await secureStorage.write(
        key: storageKey,
        value: base64UrlEncode(hiveKey),
      );
      key = await secureStorage.read(key: storageKey);
    }
    return key!;
  }

  static Future<Uint8List> getEncryptionKey() async {
    final key = await initEncryptionKey();
    final Uint8List encryptionKey = base64.decode(key);
    return encryptionKey;
  }
}
