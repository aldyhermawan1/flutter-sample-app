import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:sample/features/jokes/data/remote/model/joke_response.dart';

part 'joke_api_client.g.dart';

@RestApi()
abstract interface class JokeApiClient {
  factory JokeApiClient(Dio dio, {String baseUrl}) = _JokeApiClient;

  @GET('jokes/goodJokes')
  Future<List<JokeResponse>> getJokes();
}
