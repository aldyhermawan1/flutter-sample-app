import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sample/core/base/bloc/bloc_observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../../utils/firebase/firebase_options.dart';
import '../di/injector.dart';
import 'app.dart';

setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  // INITIALIZE FIREBASE
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // ADD BLOC OBSERVER
  if (!kReleaseMode) Bloc.observer = BaseBlocObserver();

  // SETUP HIVE DB
  await Hive.initFlutter();

  // INJECT ALL MODULES
  await injectModules();

  // SETUP FIREBASE CRASHLYTICS
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // SET PORTRAIT ORIENTATION
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(const App()),
  );
}
