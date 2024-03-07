import 'package:sample/features/jokes/data/local/model/joke_hive_object.dart';
import 'package:sample/features/jokes/data/remote/model/joke_response.dart';

abstract interface class JokeRepository {
  Future<List<JokeResponse>> getApiJokes();

  Future<List<JokeHiveObject>> getFavJokes();

  Future<void> saveFavJoke(JokeHiveObject object);

  Future<void> deleteFavJoke(JokeHiveObject object);

  Future<void> deleteAllFavJoke();
}