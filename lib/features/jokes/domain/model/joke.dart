import 'package:equatable/equatable.dart';

class Joke extends Equatable {
  final String id;
  final String type;
  final String setup;
  final String punchline;

  const Joke({
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

  static Joke dummy() {
    return const Joke(
      id: '1',
      type: 'general',
      setup: 'Knock Knock',
      punchline: "Who's There",
    );
  }
}
