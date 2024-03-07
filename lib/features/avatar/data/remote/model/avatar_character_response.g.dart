// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar_character_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvatarCharacterResponse _$AvatarCharacterResponseFromJson(
        Map<String, dynamic> json) =>
    AvatarCharacterResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      bio: json['bio'] == null
          ? null
          : BioResponse.fromJson(json['bio'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AvatarCharacterResponseToJson(
        AvatarCharacterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'bio': instance.bio,
    };
