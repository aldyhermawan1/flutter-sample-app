import 'package:sample/features/avatar/bloc/avatar_bloc.dart';

abstract class DeleteAllFavCharactersState extends AvatarState {
  const DeleteAllFavCharactersState();
}

class DeleteAllFavCharactersLoadingState extends DeleteAllFavCharactersState {
  @override
  List<Object?> get props => [];
}

class DeleteAllFavCharactersSuccessState extends DeleteAllFavCharactersState {
  @override
  List<Object?> get props => [];
}

class DeleteAllFavCharactersErrorState extends DeleteAllFavCharactersState {
  final String? code;
  final String? message;

  const DeleteAllFavCharactersErrorState({this.code, this.message});

  @override
  List<Object?> get props => [];
}
