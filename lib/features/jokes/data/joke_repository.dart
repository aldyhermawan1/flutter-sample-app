import 'package:sample/features/jokes/data/remote/model/joke_response.dart';

abstract interface class JokeRepository {
  Future<List<JokeResponse>> getJokes();
}
