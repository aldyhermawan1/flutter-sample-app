import 'package:sample/features/jokes/bloc/joke_bloc.dart';

import '../../domain/model/joke.dart';

abstract class DeleteAllFavJokeState extends JokeState {
  const DeleteAllFavJokeState();
}

class DeleteAllFavJokeLoadingState extends DeleteAllFavJokeState {
  @override
  List<Object?> get props => [];
}

class DeleteAllFavJokeSuccessState extends DeleteAllFavJokeState {
  @override
  List<Object?> get props => [];
}

class DeleteAllFavJokeErrorState extends DeleteAllFavJokeState {
  final String? code;
  final String? message;

  const DeleteAllFavJokeErrorState({this.code, this.message});

  @override
  List<Object?> get props => [];
}
