import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/themes/app_themes.dart';
import 'package:movie_app/core/themes/theme_controller.dart';
import 'package:movie_app/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieZoneApp extends StatelessWidget {
  final SharedPreferences prefs;
  const MovieZoneApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit(prefs)),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final themeMode =
              state is ThemeChanged ? state.themeMode : ThemeMode.system;
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            locale: const Locale('ar'),
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Movie App',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            routerConfig: AppRoutes.router,
          );
        },
      ),
    );
  }
}
