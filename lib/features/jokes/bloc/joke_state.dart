part of 'joke_bloc.dart';

abstract class JokeState extends Equatable {
  const JokeState();
}

class JokeInitial extends JokeState {
  @override
  List<Object> get props => [];
}
