import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/features/jokes/bloc/states/check_fav_joke_states.dart';
import 'package:sample/features/jokes/bloc/states/delete_all_fav_joke_states.dart';
import 'package:sample/features/jokes/bloc/states/delete_fav_joke_states.dart';
import 'package:sample/features/jokes/bloc/states/get_fav_jokes_states.dart';
import 'package:sample/features/jokes/bloc/states/get_joke_of_the_day_states.dart';
import 'package:sample/features/jokes/bloc/states/get_jokes_states.dart';
import 'package:sample/features/jokes/bloc/states/save_fav_joke_states.dart';
import 'package:sample/features/jokes/domain/model/joke.dart';

import '../../../core/base/error/exceptions/api_exception.dart';
import '../../../core/base/error/exceptions/app_exception.dart';
import '../domain/joke_use_case.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final JokeUseCase _useCase;

  JokeBloc(this._useCase) : super(JokeInitial()) {
    on<GetJokesEvent>(_onGetJokesEvent);
    on<GetFavJokesEvent>(_onGetFavJokesEvent);
    on<GetJokeOfTheDayEvent>(_onGetJokeOfTheDayEvent);
    on<SaveFavJokeEvent>(_onSaveFavJokeEvent);
    on<DeleteFavJokeEvent>(_onDeleteFavJokeEvent);
    on<DeleteAllFavJokeEvent>(_onDeleteAllFavJokeEvent);
    on<CheckFavJokeEvent>(_onCheckFavJokeEvent);
  }

  Future<void> _onGetJokesEvent(
    GetJokesEvent event,
    Emitter<JokeState> emitter,
  ) async {
    emitter(GetJokesLoadingState());
    try {
      var data = await _useCase.getJokes();
      if (data.isEmpty) {
        emitter(GetJokesEmptyState());
        return;
      }
      emitter(GetJokesSuccessState(data));
    } on ApiException catch (error) {
      emitter(
        GetJokesErrorState(code: error.errorCode, message: error.message),
      );
    } on AppException catch (error) {
      emitter(GetJokesErrorState(message: error.message));
    } catch (error) {
      emitter(GetJokesErrorState(message: error.toString()));
    }
  }

  Future<void> _onGetFavJokesEvent(
    GetFavJokesEvent event,
    Emitter<JokeState> emitter,
  ) async {
    emitter(GetFavJokesLoadingState());
    try {
      var data = await _useCase.getFavJokes();
      if (data.isEmpty) {
        emitter(GetFavJokesEmptyState());
        return;
      }
      emitter(GetFavJokesSuccessState(data));
    } on ApiException catch (error) {
      emitter(
        GetFavJokesErrorState(code: error.errorCode, message: error.message),
      );
    } on AppException catch (error) {
      emitter(GetFavJokesErrorState(message: error.message));
    } catch (error) {
      emitter(GetFavJokesErrorState(message: error.toString()));
    }
  }

  Future<void> _onGetJokeOfTheDayEvent(
    GetJokeOfTheDayEvent event,
    Emitter<JokeState> emitter,
  ) async {
    emitter(GetJokeOfTheDayLoadingState());
    try {
      var data = await _useCase.getJokeOfTheDay();
      emitter(GetJokeOfTheDaySuccessState(data));
    } on ApiException catch (error) {
      emitter(
        GetJokeOfTheDayErrorState(
            code: error.errorCode, message: error.message),
      );
    } on AppException catch (error) {
      emitter(GetJokeOfTheDayErrorState(message: error.message));
    } catch (error) {
      emitter(GetJokeOfTheDayErrorState(message: error.toString()));
    }
  }

  Future<void> _onSaveFavJokeEvent(
    SaveFavJokeEvent event,
    Emitter<JokeState> emitter,
  ) async {
    emitter(SaveFavJokeLoadingState());
    try {
      await _useCase.saveFavJoke(event.joke);
      emitter(SaveFavJokeSuccessState());
    } on ApiException catch (error) {
      emitter(
        SaveFavJokeErrorState(code: error.errorCode, message: error.message),
      );
    } on AppException catch (error) {
      emitter(SaveFavJokeErrorState(message: error.message));
    } catch (error) {
      emitter(SaveFavJokeErrorState(message: error.toString()));
    }
  }

  Future<void> _onDeleteFavJokeEvent(
    DeleteFavJokeEvent event,
    Emitter<JokeState> emitter,
  ) async {
    emitter(DeleteFavJokeLoadingState());
    try {
      await _useCase.deleteFavJoke(event.joke);
      emitter(DeleteFavJokeSuccessState());
    } on ApiException catch (error) {
      emitter(
        DeleteFavJokeErrorState(code: error.errorCode, message: error.message),
      );
    } on AppException catch (error) {
      emitter(DeleteFavJokeErrorState(message: error.message));
    } catch (error) {
      emitter(DeleteFavJokeErrorState(message: error.toString()));
    }
  }

  Future<void> _onDeleteAllFavJokeEvent(
    DeleteAllFavJokeEvent event,
    Emitter<JokeState> emitter,
  ) async {
    emitter(DeleteAllFavJokeLoadingState());
    try {
      await _useCase.deleteAllFavJoke();
      emitter(DeleteAllFavJokeSuccessState());
    } on ApiException catch (error) {
      emitter(
        DeleteAllFavJokeErrorState(
            code: error.errorCode, message: error.message),
      );
    } on AppException catch (error) {
      emitter(DeleteAllFavJokeErrorState(message: error.message));
    } catch (error) {
      emitter(DeleteAllFavJokeErrorState(message: error.toString()));
    }
  }

  Future<void> _onCheckFavJokeEvent(
    CheckFavJokeEvent event,
    Emitter<JokeState> emitter,
  ) async {
    emitter(CheckFavJokeLoadingState());
    try {
      var data = await _useCase.checkFavJoke(event.joke);
      emitter(CheckFavJokeSuccessState(joke: event.joke, status: data));
    } on ApiException catch (error) {
      emitter(
        CheckFavJokeErrorState(code: error.errorCode, message: error.message),
      );
    } on AppException catch (error) {
      emitter(CheckFavJokeErrorState(message: error.message));
    } catch (error) {
      emitter(CheckFavJokeErrorState(message: error.toString()));
    }
  }
}
