import 'package:sample/features/jokes/data/local/model/joke_hive_object.dart';
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

  static Joke mapJokeHiveObjectToDomain(JokeHiveObject object) {
    return Joke(
      id: object.id.orEmpty(),
      type: object.type.orEmpty(),
      setup: object.setup.orEmpty(),
      punchline: object.punchline.orEmpty(),
    );
  }

  static JokeHiveObject mapJokeToHiveObject(Joke joke) {
    return JokeHiveObject(
      id: joke.id,
      type: joke.type,
      setup: joke.setup,
      punchline: joke.punchline,
    );
  }
}
