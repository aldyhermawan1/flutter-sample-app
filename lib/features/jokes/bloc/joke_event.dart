part of 'joke_bloc.dart';

abstract class JokeEvent extends Equatable {
  const JokeEvent();
}

class GetJokesEvent extends JokeEvent {
  @override
  List<Object?> get props => [];
}

class GetJokeOfTheDayEvent extends JokeEvent {
  @override
  List<Object?> get props => [];
}

class GetFavJokesEvent extends JokeEvent {
  @override
  List<Object?> get props => [];
}

class SaveFavJokeEvent extends JokeEvent {
  final Joke joke;

  const SaveFavJokeEvent(this.joke);

  @override
  List<Object?> get props => [joke];
}

class DeleteFavJokeEvent extends JokeEvent {
  final Joke joke;

  const DeleteFavJokeEvent(this.joke);

  @override
  List<Object?> get props => [joke];
}

class DeleteAllFavJokeEvent extends JokeEvent {
  @override
  List<Object?> get props => [];
}
