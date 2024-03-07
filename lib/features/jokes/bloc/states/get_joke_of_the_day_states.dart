import 'package:sample/features/jokes/bloc/joke_bloc.dart';

import '../../domain/model/joke.dart';

abstract class GetJokeOfTheDayState extends JokeState {
  const GetJokeOfTheDayState();
}

class GetJokeOfTheDayLoadingState extends GetJokeOfTheDayState {
  @override
  List<Object?> get props => [];
}

class GetJokeOfTheDaySuccessState extends GetJokeOfTheDayState {
  final Joke joke;

  const GetJokeOfTheDaySuccessState(this.joke);

  @override
  List<Object?> get props => [];
}

class GetJokeOfTheDayErrorState extends GetJokeOfTheDayState {
  final String? code;
  final String? message;

  const GetJokeOfTheDayErrorState({this.code, this.message});

  @override
  List<Object?> get props => [];
}
