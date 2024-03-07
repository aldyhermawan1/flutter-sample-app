import 'package:equatable/equatable.dart';

class AvatarCharacter extends Equatable {
  final String id;
  final String name;
  final String image;
  final List<String> alternativeNames;
  final String nationality;
  final String ethnicity;
  final String born;

  const AvatarCharacter({
    required this.id,
    required this.name,
    required this.image,
    required this.alternativeNames,
    required this.nationality,
    required this.ethnicity,
    required this.born,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        alternativeNames,
        nationality,
        ethnicity,
        born,
      ];
}
