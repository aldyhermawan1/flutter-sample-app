import 'package:sample/features/jokes/bloc/joke_bloc.dart';

import '../../domain/model/joke.dart';

abstract class DeleteFavJokeState extends JokeState {
  const DeleteFavJokeState();
}

class DeleteFavJokeLoadingState extends DeleteFavJokeState {
  @override
  List<Object?> get props => [];
}

class DeleteFavJokeSuccessState extends DeleteFavJokeState {
  @override
  List<Object?> get props => [];
}

class DeleteFavJokeErrorState extends DeleteFavJokeState {
  final String? code;
  final String? message;

  const DeleteFavJokeErrorState({this.code, this.message});

  @override
  List<Object?> get props => [];
}
