import 'package:alice/alice.dart';
import 'package:go_router/go_router.dart';
import 'package:sample/features/avatar/presentation/avatar_screen.dart';
import 'package:sample/features/jokes/presentation/joke_list_screen.dart';
import 'package:sample/features/jokes/presentation/joke_screen.dart';
import 'package:sample/features/main_screen.dart';

import '../core/di/injector.dart';

class AppRouter {
  static GoRouter get router => _router;

  static final _router = GoRouter(
    initialLocation: MainScreen.routeName,
    navigatorKey: locator<Alice>().getNavigatorKey(),
    routes: _routes,
  );

  static final _routes = <RouteBase>[
    GoRoute(
      name: MainScreen.routeName,
      path: MainScreen.routeName,
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      name: JokeScreen.routeName,
      path: JokeScreen.routeName,
      builder: (context, state) => const JokeScreen(),
    ),
    GoRoute(
      name: JokeListScreen.routeName,
      path: JokeListScreen.routeName,
      builder: (context, state) => const JokeListScreen(),
    ),
    GoRoute(
      name: AvatarScreen.routeName,
      path: AvatarScreen.routeName,
      builder: (context, state) => const AvatarScreen(),
    ),
  ];
}
