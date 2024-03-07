import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'avatar_character_hive_object.g.dart';

@HiveType(typeId: 1)
class AvatarCharacterHiveObject extends Equatable {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final List<String> alternativeNames;

  @HiveField(4)
  final String nationality;

  @HiveField(5)
  final String ethnicity;

  @HiveField(6)
  final String born;

  const AvatarCharacterHiveObject({
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
