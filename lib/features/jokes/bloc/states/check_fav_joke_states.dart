import 'package:sample/features/jokes/bloc/joke_bloc.dart';

import '../../domain/model/joke.dart';

abstract class CheckFavJokeState extends JokeState {
  const CheckFavJokeState();
}

class CheckFavJokeLoadingState extends CheckFavJokeState {
  @override
  List<Object?> get props => [];
}

class CheckFavJokeSuccessState extends CheckFavJokeState {
  final Joke joke;
  final bool status;

  const CheckFavJokeSuccessState({
    required this.joke,
    required this.status,
  });

  @override
  List<Object?> get props => [joke, status];
}

class CheckFavJokeErrorState extends CheckFavJokeState {
  final String? code;
  final String? message;

  const CheckFavJokeErrorState({this.code, this.message});

  @override
  List<Object?> get props => [];
}
