import 'package:sample/features/jokes/data/remote/model/joke_response.dart';
import 'package:sample/features/jokes/domain/model/joke.dart';
import 'package:sample/utils/extensions/string_ext.dart';

class JokeMapper {
  static Joke mapJokeResponseToDomain(JokeResponse response) {
    return Joke(
      id: response.id.toString(),
      type: response.type.orEmpty(),
      setup: response.setup.orEmpty(),
      punchline: response.punchline.orEmpty(),
    );
  }
}
