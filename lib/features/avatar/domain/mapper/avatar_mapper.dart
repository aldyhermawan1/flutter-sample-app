
import 'package:sample/utils/common_utils.dart';
import 'package:sample/utils/extensions/string_ext.dart';

import '../../data/local/model/avatar_character_hive_object.dart';
import '../../data/remote/model/avatar_character_response.dart';
import '../model/avatar_character.dart';

class AvatarMapper {
  static AvatarCharacter mapAvatarCharacterResponseToDomain(
      AvatarCharacterResponse response) {
    return AvatarCharacter(
      id: response.id.toString(),
      name: response.name.orEmpty(),
      image: response.image.orEmpty(),
      alternativeNames: response.bio?.alternativeNames ?? List.empty(),
      nationality: response.bio?.nationality ?? CommonUtils.emptyString(),
      ethnicity: response.bio?.ethnicity ?? CommonUtils.emptyString(),
      born: response.bio?.born ?? CommonUtils.emptyString(),
    );
  }

  static AvatarCharacter mapAvatarCharacterHiveObjectToDomain(
      AvatarCharacterHiveObject object) {
    return AvatarCharacter(
      id: object.id.orEmpty(),
      name: object.name.orEmpty(),
      image: object.image.orEmpty(),
      alternativeNames: object.alternativeNames,
      nationality: object.nationality,
      ethnicity: object.ethnicity,
      born: object.born,
    );
  }

  static AvatarCharacterHiveObject mapAvatarCharacterToHiveObject(
      AvatarCharacter character) {
    return AvatarCharacterHiveObject(
      id: character.id,
      name: character.name.orEmpty(),
      image: character.image.orEmpty(),
      alternativeNames: character.alternativeNames,
      nationality: character.nationality,
      ethnicity: character.ethnicity,
      born: character.born,
    );
  }
}
