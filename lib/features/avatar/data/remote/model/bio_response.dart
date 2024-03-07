import 'package:json_annotation/json_annotation.dart';

part 'bio_response.g.dart';

@JsonSerializable()
class BioResponse {
  @JsonKey(name: 'alternativeNames')
  final List<String>? alternativeNames;

  @JsonKey(name: 'nationality')
  final String? nationality;

  @JsonKey(name: 'ethnicity')
  final String? ethnicity;

  @JsonKey(name: 'born')
  final String? born;

  const BioResponse({
    this.alternativeNames,
    this.nationality,
    this.ethnicity,
    this.born,
  });

  factory BioResponse.fromJson(Map<String, dynamic> json) =>
      _$BioResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BioResponseToJson(this);
}
