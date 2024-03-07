import 'dart:math';

import 'package:sample/features/jokes/domain/joke_use_case.dart';
import 'package:sample/features/jokes/domain/mapper/joke_mapper.dart';
import 'package:sample/features/jokes/domain/model/joke.dart';

import '../data/joke_repository.dart';

class JokeInteractor implements JokeUseCase {
  final JokeRepository _repository;

  JokeInteractor(this._repository);

  @override
  Future<void> deleteAllFavJoke() {
    return _repository.deleteAllFavJoke();
  }

  @override
  Future<void> deleteFavJoke(Joke joke) {
    return _repository.deleteFavJoke(JokeMapper.mapJokeToHiveObject(joke));
  }

  @override
  Future<List<Joke>> getFavJokes() {
    return _repository.getFavJokes().then((value) =>
        value.map((e) => JokeMapper.mapJokeHiveObjectToDomain(e)).toList());
  }

  @override
  Future<Joke> getJokeOfTheDay() {
    return _repository.getApiJokes().then((value) =>
        JokeMapper.mapJokeResponseToDomain(
            value.elementAt(Random().nextInt(value.length - 1))));
  }

  @override
  Future<List<Joke>> getJokes() {
    return _repository.getApiJokes().then((value) =>
        value.map((e) => JokeMapper.mapJokeResponseToDomain(e)).toList());
  }

  @override
  Future<void> saveFavJoke(Joke joke) {
    return _repository.saveFavJoke(JokeMapper.mapJokeToHiveObject(joke));
  }
}
