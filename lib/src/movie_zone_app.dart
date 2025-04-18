import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/core/controllers/locale_controller.dart';
import 'package:movie_app/src/core/routing/routes.dart';
import 'package:movie_app/src/core/themes/app_themes.dart';
import 'package:movie_app/src/core/controllers/theme_controller.dart';
import 'package:movie_app/src/core/utils/service_locator.dart';
import 'package:movie_app/src/features/bookmark/domain/repositories/bookmark_repository.dart';
import 'package:movie_app/src/features/bookmark/presentation/controller/bookmark_cubit.dart';
import 'package:movie_app/src/features/profile/data/repositories/user_repo_impl.dart';
import 'package:movie_app/src/features/profile/presentation/controller/cubit/user_cubit_cubit.dart';
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
        BlocProvider(
            create: (_) => UserCubit(getIt<UserRepoImpl>())..getUser()),
        BlocProvider(
            create: (_) =>
                BookmarkCubit(getIt<BookmarkRepository>())..loadBookmarks()),
      ],
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return ScreenUtilInit(
                designSize: const Size(360, 800),
                minTextAdapt: true,
                builder: (context, child) {
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    locale: locale,
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    theme: AppTheme.lightTheme,
                    darkTheme: AppTheme.darkTheme,
                    themeMode: themeMode,
                    routerConfig: AppRoutes.router,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
