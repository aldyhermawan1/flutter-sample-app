import 'package:sample/features/avatar/domain/model/avatar_character.dart';

abstract interface class AvatarUseCase {
  Future<List<AvatarCharacter>> getAvatarCharacters();

  Future<List<AvatarCharacter>> getFavCharacters();

  Future<void> saveFavCharacter(AvatarCharacter avatarCharacter);

  Future<void> deleteFavCharacter(AvatarCharacter avatarCharacter);

  Future<void> deleteAllFavCharacters();

  Future<bool> checkFavCharacter(AvatarCharacter avatarCharacter);
}
