import 'package:sample/features/jokes/data/joke_repository.dart';
import 'package:sample/features/jokes/data/local/model/joke_hive_object.dart';
import 'package:sample/features/jokes/data/remote/joke_api_client.dart';
import 'package:sample/features/jokes/data/remote/model/joke_response.dart';

import 'local/joke_hive_db.dart';

class JokeDataStore implements JokeRepository {
  final JokeApiClient _api;
  final JokeHiveDb _db;

  JokeDataStore(this._api, this._db);

  @override
  Future<void> deleteAllFavJoke() {
    return _db.deleteFromDisk();
  }

  @override
  Future<void> deleteFavJoke(JokeHiveObject object) {
    return _db.deleteJoke(object);
  }

  @override
  Future<List<JokeResponse>> getApiJokes() {
    return _api.getJokes();
  }

  @override
  Future<List<JokeHiveObject>> getFavJokes() {
    return _db.getJokes();
  }

  @override
  Future<void> saveFavJoke(JokeHiveObject object) {
    return _db.saveJoke(object);
  }
}
