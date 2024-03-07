import 'package:sample/features/avatar/data/local/model/avatar_character_hive_object.dart';
import 'package:sample/features/avatar/data/remote/avatar_api_client.dart';
import 'package:sample/features/avatar/data/remote/model/avatar_character_response.dart';

import 'avatar_repository.dart';
import 'local/avatar_hive_db.dart';


class AvatarDataStore implements AvatarRepository {
  final AvatarApiClient _api;
  final AvatarHiveDb _db;

  AvatarDataStore(this._api, this._db);

  @override
  Future<bool> checkFavAvatarCharacter(AvatarCharacterHiveObject object) {
    return _db.checkStatus(object);
  }

  @override
  Future<void> deleteAllFavAvatarCharacters() {
    return _db.deleteFromDisk();
  }

  @override
  Future<void> deleteFavAvatarCharacter(AvatarCharacterHiveObject object) {
    return _db.deleteAvatarCharacter(object);
  }

  @override
  Future<List<AvatarCharacterResponse>> getAvatarCharacters() {
    return _api.getAvatarCharacters();
  }

  @override
  Future<List<AvatarCharacterHiveObject>> getFavAvatarCharacters() {
    return _db.getAvatarCharacters();
  }

  @override
  Future<void> saveFavAvatarCharacter(AvatarCharacterHiveObject object) {
    return _db.saveAvatarCharacter(object);
  }
}
