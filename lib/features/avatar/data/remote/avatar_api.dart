import 'package:sample/features/avatar/data/remote/model/avatar_character_response.dart';

import 'avatar_api_client.dart';

class AvatarApi implements AvatarApiClient {
  final AvatarApiClient _apiClient;

  AvatarApi(this._apiClient);

  @override
  Future<List<AvatarCharacterResponse>> getAvatarCharacters() {
    return _apiClient.getAvatarCharacters();
  }
}
