import '../../../core/di/injector.dart';
import '../bloc/joke_bloc.dart';
import '../data/joke_data_store.dart';
import '../data/joke_repository.dart';
import '../data/remote/joke_api.dart';
import '../data/remote/joke_api_client.dart';
import '../domain/joke_interactor.dart';
import '../domain/joke_use_case.dart';

void injectJokeModule() {
  locator
    ..registerSingleton(JokeApiClient(locator.get()))
    ..registerSingleton(JokeApi(locator.get()))
    ..registerSingleton<JokeRepository>(JokeDataStore(locator.get()))
    ..registerSingleton<JokeUseCase>(
        JokeInteractor(locator.get(), locator.get()))
    ..registerSingleton(JokeBloc(locator.get()));
}
