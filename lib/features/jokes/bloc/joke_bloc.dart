import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/features/jokes/bloc/states/get_joke_of_the_day_states.dart';
import 'package:sample/features/jokes/bloc/states/get_jokes_states.dart';

import '../../../core/base/error/exceptions/api_exception.dart';
import '../../../core/base/error/exceptions/app_exception.dart';
import '../domain/joke_use_case.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final JokeUseCase _useCase;

  JokeBloc(this._useCase) : super(JokeInitial()) {
    on<GetJokesEvent>(_onGetJokesEvent);
    on<GetJokeOfTheDayEvent>(_onGetJokeOfTheDayEvent);
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
}
