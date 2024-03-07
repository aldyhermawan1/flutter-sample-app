import 'package:sample/features/jokes/bloc/joke_bloc.dart';

import '../../domain/model/joke.dart';

abstract class SaveFavJokeState extends JokeState {
  const SaveFavJokeState();
}

class SaveFavJokeLoadingState extends SaveFavJokeState {
  @override
  List<Object?> get props => [];
}

class SaveFavJokeSuccessState extends SaveFavJokeState {
  @override
  List<Object?> get props => [];
}

class SaveFavJokeErrorState extends SaveFavJokeState {
  final String? code;
  final String? message;

  const SaveFavJokeErrorState({this.code, this.message});

  @override
  List<Object?> get props => [];
}
