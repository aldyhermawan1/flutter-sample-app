import 'package:sample/features/avatar/bloc/avatar_bloc.dart';
import 'package:sample/features/avatar/domain/model/avatar_character.dart';

abstract class GetFavCharactersState extends AvatarState {
  const GetFavCharactersState();
}

class GetFavCharactersLoadingState extends GetFavCharactersState {
  @override
  List<Object?> get props => [];
}

class GetFavCharactersSuccessState extends GetFavCharactersState {
  final List<AvatarCharacter> characters;

  const GetFavCharactersSuccessState(this.characters);

  @override
  List<Object?> get props => [];
}

class GetFavCharactersEmptyState extends GetFavCharactersState {
  @override
  List<Object?> get props => [];
}

class GetFavCharactersErrorState extends GetFavCharactersState {
  final String? code;
  final String? message;

  const GetFavCharactersErrorState({this.code, this.message});

  @override
  List<Object?> get props => [];
}
