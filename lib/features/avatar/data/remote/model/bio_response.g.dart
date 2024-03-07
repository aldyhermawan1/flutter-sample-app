// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bio_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BioResponse _$BioResponseFromJson(Map<String, dynamic> json) => BioResponse(
      alternativeNames: (json['alternativeNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      nationality: json['nationality'] as String?,
      ethnicity: json['ethnicity'] as String?,
      born: json['born'] as String?,
    );

Map<String, dynamic> _$BioResponseToJson(BioResponse instance) =>
    <String, dynamic>{
      'alternativeNames': instance.alternativeNames,
      'nationality': instance.nationality,
      'ethnicity': instance.ethnicity,
      'born': instance.born,
    };
