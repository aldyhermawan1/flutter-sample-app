// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JokeResponse _$JokeResponseFromJson(Map<String, dynamic> json) => JokeResponse(
      id: json['id'] as int?,
      type: json['type'] as String?,
      setup: json['setup'] as String?,
      punchline: json['punchline'] as String?,
    );

Map<String, dynamic> _$JokeResponseToJson(JokeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'setup': instance.setup,
      'punchline': instance.punchline,
    };
