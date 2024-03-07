import 'package:hive/hive.dart';
import 'package:sample/features/avatar/data/local/model/avatar_character_hive_object.dart';

import '../../../core/di/injector.dart';
import '../bloc/avatar_bloc.dart';
import '../data/avatar_data_store.dart';
import '../data/avatar_repository.dart';
import '../data/local/avatar_hive_db.dart';
import '../data/remote/avatar_api.dart';
import '../data/remote/avatar_api_client.dart';
import '../domain/avatar_interactor.dart';
import '../domain/avatar_use_case.dart';

void injectAvatarModule() {
  Hive.registerAdapter(AvatarCharacterHiveObjectAdapter());
  locator
    ..registerSingleton(AvatarHiveDb())
    ..registerSingleton(AvatarApiClient(locator.get()))
    ..registerSingleton(AvatarApi(locator.get()))
    ..registerSingleton<AvatarRepository>(
        AvatarDataStore(locator.get(), locator.get()))
    ..registerSingleton<AvatarUseCase>(
        AvatarInteractor(locator.get()))
    ..registerSingleton(AvatarBloc(locator.get()));
}
