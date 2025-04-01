import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app/core/controllers/locale_controller.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/themes/app_themes.dart';
import 'package:movie_app/core/controllers/theme_controller.dart';
import 'package:movie_app/core/utils/service_locator.dart';
import 'package:movie_app/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieZoneApp extends StatelessWidget {
  const MovieZoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit(getIt<SharedPreferences>())),
        BlocProvider(create: (_) => LocaleCubit(getIt<SharedPreferences>())),
      ],
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                locale: locale,
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
          );
        },
      ),
    );
  }
}
