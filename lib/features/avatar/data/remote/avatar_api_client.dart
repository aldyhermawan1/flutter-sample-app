import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:sample/features/avatar/data/remote/model/avatar_character_response.dart';

part 'avatar_api_client.g.dart';

@RestApi()
abstract interface class AvatarApiClient {
  factory AvatarApiClient(Dio dio, {String baseUrl}) = _AvatarApiClient;

  @GET('avatar/characters')
  Future<List<AvatarCharacterResponse>> getAvatarCharacters();
}
