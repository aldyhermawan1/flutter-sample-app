import 'model/joke.dart';

abstract interface class JokeUseCase {
  Future<List<Joke>> getJokes();

  Future<Joke> getJokeOfTheDay();
}
