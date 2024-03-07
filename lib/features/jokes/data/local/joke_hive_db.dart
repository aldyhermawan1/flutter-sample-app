import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:sample/features/jokes/data/local/model/joke_hive_object.dart';

import '../../../../utils/security_utils.dart';

class JokeHiveDb {
  static const _boxName = 'jokeBox';

  Future<Box<JokeHiveObject>> _boxJoke() async {
    final Uint8List storageKey = await SecurityUtils.getEncryptionKey();
    Box<JokeHiveObject> box = await Hive.openBox(
      _boxName,
      encryptionCipher: HiveAesCipher(storageKey),
    );
    return box;
  }

  Future<List<JokeHiveObject>> getJokes() async {
    final box = await _boxJoke();
    return box.values.toList();
  }

  Future<void> saveJoke(JokeHiveObject object) async {
    final box = await _boxJoke();
    await box.add(object);
  }

  Future<void> deleteJoke(JokeHiveObject object) async {
    final box = await _boxJoke();
    var list = box.values.toList();
    await box.deleteAt(list.indexOf(object));
  }

  Future<void> deleteFromDisk() async {
    final box = await _boxJoke();
    await box.deleteFromDisk();
  }
}
