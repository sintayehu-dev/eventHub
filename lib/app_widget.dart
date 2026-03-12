import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:eventhub/core/application/app/bloc/app_bloc.dart';
import 'package:eventhub/core/application/app/bloc/app_state.dart';
import 'package:eventhub/core/application/app/bloc/app_event.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_bloc.dart';
import 'package:eventhub/core/router/router.dart';
import 'package:eventhub/core/theme/app_theme.dart';
import 'package:eventhub/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  previous.isConnected != current.isConnected ||
                  previous.isInitialized != current.isInitialized,
              builder: (context, state) {
                // If app is not initialized and not connected, show offline screen
                if (!state.isInitialized && !state.isConnected) {
                  return Scaffold(
                    body: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.surface,
                            AppColors.primaryContainer.withValues(alpha: 0.1),
                          ],
                        ),
                      ),
                      child: SafeArea(
                        child: Center(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(24.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.primaryIndigo
                                            .withValues(alpha: 0.1),
                                        blurRadius: 20,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.wifi_off_rounded,
                                    size: 25.sp,
                                    color: AppColors.primaryIndigo,
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Text(
                                  'No Internet Connection',
                                  style: GoogleFonts.outfit(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.onSurface,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  'Please check your connection.',
                                  style: GoogleFonts.outfit(
                                    fontSize: 14.sp,
                                    color: AppColors.grey600,
                                    height: 1.5,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }

                // If app is initialized or connected, show normal app
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
