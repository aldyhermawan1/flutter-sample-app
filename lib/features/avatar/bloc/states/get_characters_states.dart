import 'package:sample/features/avatar/bloc/avatar_bloc.dart';
import 'package:sample/features/avatar/domain/model/avatar_character.dart';

abstract class GetCharactersState extends AvatarState {
  const GetCharactersState();
}

class GetCharactersLoadingState extends GetCharactersState {
  @override
  List<Object?> get props => [];
}

class GetCharactersSuccessState extends GetCharactersState {
  final List<AvatarCharacter> jokes;

  const GetCharactersSuccessState(this.jokes);

  @override
  List<Object?> get props => [];
}

class GetCharactersEmptyState extends GetCharactersState {
  @override
  List<Object?> get props => [];
}

class GetCharactersErrorState extends GetCharactersState {
  final String? code;
  final String? message;

  const GetCharactersErrorState({this.code, this.message});

  @override
  List<Object?> get props => [];
}
