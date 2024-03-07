import 'package:sample/features/jokes/data/joke_repository.dart';
import 'package:sample/features/jokes/data/remote/joke_api_client.dart';
import 'package:sample/features/jokes/data/remote/model/joke_response.dart';

class JokeDataStore implements JokeRepository {
  final JokeApiClient _api;

  JokeDataStore(this._api);

  @override
  Future<List<JokeResponse>> getJokes() {
    return _api.getJokes();
  }
}
