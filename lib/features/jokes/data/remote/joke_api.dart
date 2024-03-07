import 'package:sample/features/jokes/data/remote/joke_api_client.dart';
import 'package:sample/features/jokes/data/remote/model/joke_response.dart';

class JokeApi implements JokeApiClient {
  final JokeApiClient _apiClient;

  JokeApi(this._apiClient);

  @override
  Future<List<JokeResponse>> getJokes() {
    return _apiClient.getJokes();
  }
}
