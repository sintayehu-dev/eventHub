import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:eventhub/core/application/app/bloc/app_bloc.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_bloc.dart';
import 'package:eventhub/core/router/router.dart';
import 'package:eventhub/core/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppBloc()..add(const AppEvent.getThemeMode()),
        ),
        BlocProvider(
          create: (context) => GetIt.instance<AuthStatusBloc>(),
        ),
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'EventHub',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          themeMode: context.watch<AppBloc>().state.isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,
          routerConfig: router,
          builder: (context, child) {
            return BlocBuilder<AppBloc, AppState>(
              buildWhen: (previous, current) =>
                  previous.isInitialized != current.isInitialized,
              builder: (context, state) {
                // Initialize app if not already initialized
                if (!state.isInitialized) {
                  context.read<AppBloc>().add(const AppEvent.appInitialized());
                }
                return child!;
              },
            );
          },
        );
      },
    );
  }
}
