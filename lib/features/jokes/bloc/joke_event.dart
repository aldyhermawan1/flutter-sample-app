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
