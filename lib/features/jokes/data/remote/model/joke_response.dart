import 'package:json_annotation/json_annotation.dart';

part 'joke_response.g.dart';

@JsonSerializable()
class JokeResponse {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'setup')
  final String? setup;

  @JsonKey(name: 'punchline')
  final String? punchline;

  const JokeResponse({
    this.id,
    this.type,
    this.setup,
    this.punchline,
  });

  factory JokeResponse.fromJson(Map<String, dynamic> json) =>
      _$JokeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$JokeResponseToJson(this);
}
