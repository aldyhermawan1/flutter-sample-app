part of 'avatar_bloc.dart';

abstract class AvatarEvent extends Equatable {
  const AvatarEvent();
}

class GetCharactersEvent extends AvatarEvent {
  @override
  List<Object?> get props => [];
}

class GetFavCharactersEvent extends AvatarEvent {
  @override
  List<Object?> get props => [];
}

class SaveFavCharacterEvent extends AvatarEvent {
  final AvatarCharacter character;

  const SaveFavCharacterEvent(this.character);

  @override
  List<Object?> get props => [character];
}

class DeleteFavCharacterEvent extends AvatarEvent {
  final AvatarCharacter character;

  const DeleteFavCharacterEvent(this.character);

  @override
  List<Object?> get props => [character];
}

class DeleteAllFavCharacterEvent extends AvatarEvent {
  @override
  List<Object?> get props => [];
}

class CheckFavCharacterEvent extends AvatarEvent {
  final AvatarCharacter character;

  const CheckFavCharacterEvent(this.character);

  @override
  List<Object?> get props => [];
}
