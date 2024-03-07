import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/features/avatar/bloc/states/check_fav_character_states.dart';
import 'package:sample/features/avatar/bloc/states/delete_all_fav_characters_states.dart';
import 'package:sample/features/avatar/bloc/states/delete_fav_character_states.dart';
import 'package:sample/features/avatar/bloc/states/get_characters_states.dart';
import 'package:sample/features/avatar/bloc/states/get_fav_characters_states.dart';
import 'package:sample/features/avatar/bloc/states/save_fav_character_states.dart';
import 'package:sample/features/avatar/domain/model/avatar_character.dart';

import '../../../core/base/error/exceptions/api_exception.dart';
import '../../../core/base/error/exceptions/app_exception.dart';
import '../domain/avatar_use_case.dart';

part 'avatar_event.dart';
part 'avatar_state.dart';

class AvatarBloc extends Bloc<AvatarEvent, AvatarState> {
  final AvatarUseCase _useCase;

  AvatarBloc(this._useCase) : super(AvatarInitial()) {
    on<GetCharactersEvent>(_onGetCharactersEvent);
    on<GetFavCharactersEvent>(_onGetFavCharactersEvent);
    on<SaveFavCharacterEvent>(_onSaveFavCharacterEvent);
    on<DeleteFavCharacterEvent>(_onDeleteFavCharacterEvent);
    on<DeleteAllFavCharacterEvent>(_onDeleteAllFavCharacterEvent);
    on<CheckFavCharacterEvent>(_onCheckFavCharacterEvent);
  }

  Future<void> _onGetCharactersEvent(
    GetCharactersEvent event,
    Emitter<AvatarState> emitter,
  ) async {
    emitter(GetCharactersLoadingState());
    try {
      var data = await _useCase.getAvatarCharacters();
      if (data.isEmpty) {
        emitter(GetCharactersEmptyState());
        return;
      }
      emitter(GetCharactersSuccessState(data));
    } on ApiException catch (error) {
      emitter(
        GetCharactersErrorState(code: error.errorCode, message: error.message),
      );
    } on AppException catch (error) {
      emitter(GetCharactersErrorState(message: error.message));
    } catch (error) {
      emitter(GetCharactersErrorState(message: error.toString()));
    }
  }

  Future<void> _onGetFavCharactersEvent(
    GetFavCharactersEvent event,
    Emitter<AvatarState> emitter,
  ) async {
    emitter(GetFavCharactersLoadingState());
    try {
      var data = await _useCase.getFavCharacters();
      if (data.isEmpty) {
        emitter(GetFavCharactersEmptyState());
        return;
      }
      emitter(GetFavCharactersSuccessState(data));
    } on ApiException catch (error) {
      emitter(
        GetFavCharactersErrorState(
            code: error.errorCode, message: error.message),
      );
    } on AppException catch (error) {
      emitter(GetFavCharactersErrorState(message: error.message));
    } catch (error) {
      emitter(GetFavCharactersErrorState(message: error.toString()));
    }
  }

  Future<void> _onSaveFavCharacterEvent(
    SaveFavCharacterEvent event,
    Emitter<AvatarState> emitter,
  ) async {
    emitter(SaveFavCharacterLoadingState());
    try {
      await _useCase.saveFavCharacter(event.character);
      emitter(SaveFavCharacterSuccessState());
    } on ApiException catch (error) {
      emitter(
        SaveFavCharacterErrorState(
            code: error.errorCode, message: error.message),
      );
    } on AppException catch (error) {
      emitter(SaveFavCharacterErrorState(message: error.message));
    } catch (error) {
      emitter(SaveFavCharacterErrorState(message: error.toString()));
    }
  }

  Future<void> _onDeleteFavCharacterEvent(
    DeleteFavCharacterEvent event,
    Emitter<AvatarState> emitter,
  ) async {
    emitter(DeleteFavCharacterLoadingState());
    try {
      await _useCase.deleteFavCharacter(event.character);
      emitter(DeleteFavCharacterSuccessState());
    } on ApiException catch (error) {
      emitter(
        DeleteFavCharacterErrorState(
            code: error.errorCode, message: error.message),
      );
    } on AppException catch (error) {
      emitter(DeleteFavCharacterErrorState(message: error.message));
    } catch (error) {
      emitter(DeleteFavCharacterErrorState(message: error.toString()));
    }
  }

  Future<void> _onDeleteAllFavCharacterEvent(
    DeleteAllFavCharacterEvent event,
    Emitter<AvatarState> emitter,
  ) async {
    emitter(DeleteAllFavCharactersLoadingState());
    try {
      await _useCase.deleteAllFavCharacters();
      emitter(DeleteAllFavCharactersSuccessState());
    } on ApiException catch (error) {
      emitter(
        DeleteAllFavCharactersErrorState(
            code: error.errorCode, message: error.message),
      );
    } on AppException catch (error) {
      emitter(DeleteAllFavCharactersErrorState(message: error.message));
    } catch (error) {
      emitter(DeleteAllFavCharactersErrorState(message: error.toString()));
    }
  }

  Future<void> _onCheckFavCharacterEvent(
    CheckFavCharacterEvent event,
    Emitter<AvatarState> emitter,
  ) async {
    emitter(CheckFavCharacterLoadingState());
    try {
      var data = await _useCase.checkFavCharacter(event.character);
      emitter(CheckFavCharacterSuccessState(data));
    } on ApiException catch (error) {
      emitter(
        CheckFavCharacterErrorState(
            code: error.errorCode, message: error.message),
      );
    } on AppException catch (error) {
      emitter(CheckFavCharacterErrorState(message: error.message));
    } catch (error) {
      emitter(CheckFavCharacterErrorState(message: error.toString()));
    }
  }
}
