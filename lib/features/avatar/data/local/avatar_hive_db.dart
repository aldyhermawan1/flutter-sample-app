import 'dart:typed_data';

import 'package:hive/hive.dart';

import '../../../../utils/security_utils.dart';
import 'model/avatar_character_hive_object.dart';

class AvatarHiveDb {
  static const _boxName = 'avatarBox';

  Future<Box<AvatarCharacterHiveObject>> _boxAvatar() async {
    final Uint8List storageKey = await SecurityUtils.getEncryptionKey();
    Box<AvatarCharacterHiveObject> box = await Hive.openBox(
      _boxName,
      encryptionCipher: HiveAesCipher(storageKey),
    );
    return box;
  }

  Future<List<AvatarCharacterHiveObject>> getAvatarCharacters() async {
    final box = await _boxAvatar();
    return box.values.toList();
  }

  Future<bool> checkStatus(AvatarCharacterHiveObject object) async {
    final box = await _boxAvatar();
    return box.values.any((element) => element.id == object.id);
  }

  Future<void> saveAvatarCharacter(AvatarCharacterHiveObject object) async {
    final box = await _boxAvatar();
    await box.add(object);
  }

  Future<void> deleteAvatarCharacter(AvatarCharacterHiveObject object) async {
    final box = await _boxAvatar();
    var list = box.values.toList();
    await box.deleteAt(list.indexOf(object));
  }

  Future<void> deleteFromDisk() async {
    final box = await _boxAvatar();
    await box.deleteFromDisk();
  }
}
