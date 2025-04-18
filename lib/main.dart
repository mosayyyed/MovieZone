import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/src/movie_zone_app.dart';
import 'package:device_preview/device_preview.dart';

import 'src/core/utils/service_locator.dart';
import 'firebase_options.dart';

void main() async {
  await _initializeServices();

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MovieZoneApp(),
    ),
  );
}

Future<void> _initializeServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  dotenv.load(fileName: ".env");

  await setupServiceLocator();
}
