import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eventhub/firebase_options.dart';
import 'package:eventhub/core/utils/local_storage.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with proper options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Configure Firebase Auth settings for development
  await _configureFirebaseAuth();

  Bloc.observer = const AppBlocObserver();

  // Initialize LocalStorage
  await LocalStorage.ensureInitialized();

  // Add cross-flavor configuration here
  configureDependencies();

  runApp(await builder());
}

Future<void> _configureFirebaseAuth() async {
  try {
    // Configure Firebase Auth settings for development and testing
    await FirebaseAuth.instance.setSettings(
      appVerificationDisabledForTesting: true,
    );

    // Additional configuration for better debugging
    if (kDebugMode) {
      log('Firebase Auth configured for development mode');
      log('Project ID: eventhub-d5812');
      log('Auth domain: eventhub-d5812.firebaseapp.com');
    }
  } catch (e) {
    log('Firebase Auth configuration error: $e');
    // Don't throw error, just log it as the app can still function
  }
}
