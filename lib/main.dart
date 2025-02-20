import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app/core/themes/app_colors.dart';

import 'core/routing/routes.dart';
import 'core/utils/service_locator.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
      theme: ThemeData(
        primaryColor: AppColors.kPrimaryColor,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.kPrimaryColor,
          selectionColor: AppColors.kPrimaryColor.withAlpha(100),
          selectionHandleColor: AppColors.kPrimaryColor,
        ),

        scaffoldBackgroundColor: AppColors.kSecondaryColor,
        // TODO: Add dynamic font based on locale after loading Localizations
        fontFamily: 'Cairo',
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      routerConfig: AppRoutes.router,
    );
  }
}
