import 'package:flutter/material.dart';

import 'di/injection.dart';
import 'screens/splash_screen.dart';
import 'utils/app_route.dart';

void main() async {
  await setupDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'D\'Resto',
      navigatorKey: AppRoute.navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
