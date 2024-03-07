import 'dart:convert';
import 'dart:math';

import 'package:sample/core/base/preference/secure_preference/secure_preference_manager.dart';
import 'package:sample/features/jokes/data/remote/model/joke_response.dart';
import 'package:sample/features/jokes/domain/joke_use_case.dart';
import 'package:sample/features/jokes/domain/mapper/joke_mapper.dart';
import 'package:sample/features/jokes/domain/model/joke.dart';
import 'package:sample/utils/common_utils.dart';
import 'package:sample/utils/constants/preference_constants.dart';
import 'package:sample/utils/extensions/int_ext.dart';
import 'package:sample/utils/extensions/string_ext.dart';

import '../data/joke_repository.dart';

class JokeInteractor implements JokeUseCase {
  final JokeRepository _repository;
  final SecurePreferenceManager _securePreferenceManager;

  JokeInteractor(this._repository, this._securePreferenceManager);

  @override
  Future<Joke> getJokeOfTheDay() async {
    // Getting the data from the preferences
    int? lastSeeded = await _securePreferenceManager.getInt(
      key: PreferenceConstants.jokeOfTheDayLastSave,
    );
    bool isSeeded = CommonUtils.isToday(lastSeeded.orZero());
    String jsonJokeResponse = await _securePreferenceManager
        .getString(key: PreferenceConstants.jokeOfTheDay)
        .then((value) => value.orEmpty());

    // Selecting the data
    JokeResponse selectedJoke = isSeeded && jsonJokeResponse.isNotEmpty
        ? JokeResponse.fromJson(jsonDecode(jsonJokeResponse))
        : await _repository.getJokes().then((value) {
            JokeResponse selected =
                value.elementAt(Random().nextInt(value.length - 1));
            _securePreferenceManager.saveInt(
              key: PreferenceConstants.jokeOfTheDayLastSave,
              value: DateTime.now().millisecondsSinceEpoch,
            );
            _securePreferenceManager.saveString(
              key: PreferenceConstants.jokeOfTheDay,
              value: jsonEncode(selected.toJson()),
            );
            return selected;
          });

    return JokeMapper.mapJokeResponseToDomain(selectedJoke);
  }

  @override
  Future<List<Joke>> getJokes() {
    return _repository.getJokes().then((value) => value
        .map((e) => JokeMapper.mapJokeResponseToDomain(e))
        .take(15)
        .toList());
  }
}
