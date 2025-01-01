import 'package:flutter/material.dart';

import 'core/routing/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Marvel Movies',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      routerConfig: AppRoutes.router,
    );
  }
}
