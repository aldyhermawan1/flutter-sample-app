import 'model/joke.dart';

abstract interface class JokeUseCase {
  Future<List<Joke>> getJokes();

  Future<Joke> getJokeOfTheDay();

  Future<List<Joke>> getFavJokes();

  Future<void> saveFavJoke(Joke joke);

  Future<void> deleteFavJoke(Joke joke);

  Future<void> deleteAllFavJoke();
}