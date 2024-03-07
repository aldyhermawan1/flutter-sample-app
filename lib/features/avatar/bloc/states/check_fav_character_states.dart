import 'package:sample/features/avatar/bloc/avatar_bloc.dart';

abstract class CheckFavCharacterState extends AvatarState {
  const CheckFavCharacterState();
}

class CheckFavCharacterLoadingState extends CheckFavCharacterState {
  @override
  List<Object?> get props => [];
}

class CheckFavCharacterSuccessState extends CheckFavCharacterState {
  final bool status;

  const CheckFavCharacterSuccessState(this.status);

  @override
  List<Object?> get props => [status];
}

class CheckFavCharacterErrorState extends CheckFavCharacterState {
  final String? code;
  final String? message;

  const CheckFavCharacterErrorState({this.code, this.message});

  @override
  List<Object?> get props => [];
}
