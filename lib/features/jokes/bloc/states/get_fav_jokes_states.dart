import 'package:sample/features/jokes/bloc/joke_bloc.dart';

import '../../domain/model/joke.dart';

abstract class GetFavJokesState extends JokeState {
  const GetFavJokesState();
}

class GetFavJokesLoadingState extends GetFavJokesState {
  @override
  List<Object?> get props => [];
}

class GetFavJokesSuccessState extends GetFavJokesState {
  final List<Joke> jokes;

  const GetFavJokesSuccessState(this.jokes);

  @override
  List<Object?> get props => [];
}

class GetFavJokesEmptyState extends GetFavJokesState {
  @override
  List<Object?> get props => [];
}

class GetFavJokesErrorState extends GetFavJokesState {
  final String? code;
  final String? message;

  const GetFavJokesErrorState({this.code, this.message});

  @override
  List<Object?> get props => [];
}
