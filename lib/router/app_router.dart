import 'package:alice/alice.dart';
import 'package:go_router/go_router.dart';
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
    // GoRoute(
    //   name: OnboardingScreen.routeName,
    //   path: OnboardingScreen.routeName,
    //   redirect: (context, state) {
    //     PreferenceManager preference = locator.get();
    //     bool isOnboardingDone =
    //         preference.getBool(key: PreferenceConstants.ONBOARDING_KEY) ??
    //             false;
    //     if (isOnboardingDone) return LoginScreen.routeName;
    //     return null;
    //   },
    //   builder: (context, state) {
    //     return const OnboardingScreen();
    //   },
    // ),
    // GoRoute(
    //   name: LoginScreen.routeName,
    //   path: LoginScreen.routeName,
    //   builder: (context, state) {
    //     return LoginScreen(
    //       transactionDetailArguments:
    //       state.extra as GoldTransactionDetailArguments?,
    //     );
    //   },
    // ),
  ];
}
