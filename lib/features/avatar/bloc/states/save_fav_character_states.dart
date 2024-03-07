import 'package:sample/features/avatar/bloc/avatar_bloc.dart';

abstract class SaveFavCharacterState extends AvatarState {
  const SaveFavCharacterState();
}

class SaveFavCharacterLoadingState extends SaveFavCharacterState {
  @override
  List<Object?> get props => [];
}

class SaveFavCharacterSuccessState extends SaveFavCharacterState {
  @override
  List<Object?> get props => [];
}

class SaveFavCharacterErrorState extends SaveFavCharacterState {
  final String? code;
  final String? message;

  const SaveFavCharacterErrorState({this.code, this.message});

  @override
  List<Object?> get props => [];
}
