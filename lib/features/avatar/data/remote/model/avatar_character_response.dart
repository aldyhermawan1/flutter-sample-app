import 'package:json_annotation/json_annotation.dart';
import 'package:sample/features/avatar/data/remote/model/bio_response.dart';

part 'avatar_character_response.g.dart';

@JsonSerializable()
class AvatarCharacterResponse {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'image')
  final String? image;

  @JsonKey(name: 'bio')
  final BioResponse? bio;

  const AvatarCharacterResponse({
    this.id,
    this.name,
    this.image,
    this.bio,
  });

  factory AvatarCharacterResponse.fromJson(Map<String, dynamic> json) =>
      _$AvatarCharacterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarCharacterResponseToJson(this);
}
