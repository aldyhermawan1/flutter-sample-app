import 'package:sample/features/avatar/data/local/model/avatar_character_hive_object.dart';
import 'package:sample/features/avatar/data/remote/model/avatar_character_response.dart';

abstract interface class AvatarRepository {
  Future<List<AvatarCharacterResponse>> getAvatarCharacters();

  Future<List<AvatarCharacterHiveObject>> getFavAvatarCharacters();

  Future<void> saveFavAvatarCharacter(AvatarCharacterHiveObject object);

  Future<void> deleteFavAvatarCharacter(AvatarCharacterHiveObject object);

  Future<void> deleteAllFavAvatarCharacters();

  Future<bool> checkFavAvatarCharacter(AvatarCharacterHiveObject object);
}
