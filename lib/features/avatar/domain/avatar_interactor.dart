import '../data/avatar_repository.dart';
import 'avatar_use_case.dart';
import 'mapper/avatar_mapper.dart';
import 'model/avatar_character.dart';

class AvatarInteractor implements AvatarUseCase {
  final AvatarRepository _repository;

  AvatarInteractor(this._repository);

  @override
  Future<void> deleteAllFavCharacters() {
    return _repository.deleteAllFavAvatarCharacters();
  }

  @override
  Future<List<AvatarCharacter>> getAvatarCharacters() {
    return _repository.getAvatarCharacters().then((value) => value
        .map((e) => AvatarMapper.mapAvatarCharacterResponseToDomain(e))
        .take(15)
        .toList());
  }

  @override
  Future<bool> checkFavCharacter(AvatarCharacter avatarCharacter) {
    return _repository.checkFavAvatarCharacter(
        AvatarMapper.mapAvatarCharacterToHiveObject(avatarCharacter));
  }

  @override
  Future<void> deleteFavCharacter(AvatarCharacter avatarCharacter) {
    return _repository.deleteFavAvatarCharacter(
        AvatarMapper.mapAvatarCharacterToHiveObject(avatarCharacter));
  }

  @override
  Future<List<AvatarCharacter>> getFavCharacters() {
    return _repository.getFavAvatarCharacters().then((value) => value
        .map((e) => AvatarMapper.mapAvatarCharacterHiveObjectToDomain(e))
        .toList());
  }

  @override
  Future<void> saveFavCharacter(AvatarCharacter avatarCharacter) {
    return _repository.saveFavAvatarCharacter(
        AvatarMapper.mapAvatarCharacterToHiveObject(avatarCharacter));
  }
}
