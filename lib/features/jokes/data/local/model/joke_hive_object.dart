import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'joke_hive_object.g.dart';

@HiveType(typeId: 1)
class JokeHiveObject extends Equatable {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String type;

  @HiveField(2)
  final String setup;

  @HiveField(3)
  final String punchline;

  const JokeHiveObject({
    required this.id,
    required this.type,
    required this.setup,
    required this.punchline,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        setup,
        punchline,
      ];
}
