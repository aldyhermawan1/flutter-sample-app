import 'package:sample/features/jokes/bloc/joke_bloc.dart';

import '../../domain/model/joke.dart';

abstract class GetJokesState extends JokeState {
  const GetJokesState();
}

class GetJokesLoadingState extends GetJokesState {
  @override
  List<Object?> get props => [];
}

class GetJokesSuccessState extends GetJokesState {
  final List<Joke> jokes;

  const GetJokesSuccessState(this.jokes);

  @override
  List<Object?> get props => [];
}

class GetJokesEmptyState extends GetJokesState {
  @override
  List<Object?> get props => [];
}

class GetJokesErrorState extends GetJokesState {
  final String? code;
  final String? message;

  const GetJokesErrorState({this.code, this.message});

  @override
  List<Object?> get props => [];
}
