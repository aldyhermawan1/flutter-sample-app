import 'package:sample/features/avatar/bloc/avatar_bloc.dart';

abstract class DeleteFavCharacterState extends AvatarState {
  const DeleteFavCharacterState();
}

class DeleteFavCharacterLoadingState extends DeleteFavCharacterState {
  @override
  List<Object?> get props => [];
}

class DeleteFavCharacterSuccessState extends DeleteFavCharacterState {
  @override
  List<Object?> get props => [];
}

class DeleteFavCharacterErrorState extends DeleteFavCharacterState {
  final String? code;
  final String? message;

  const DeleteFavCharacterErrorState({this.code, this.message});

  @override
  List<Object?> get props => [];
}
