import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/core/di/injector.dart';
import 'package:sample/features/jokes/bloc/joke_bloc.dart';

import '../../router/app_router.dart';
import '../../values/strings.dart';
import '../../values/themes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final JokeBloc _jokeBloc = locator.get();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => _jokeBloc),
          ],
          child: MaterialApp.router(
            title: Strings.appName,
            routerConfig: AppRouter.router,
            theme: appTheme(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
