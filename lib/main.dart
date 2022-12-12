import 'package:flutter/material.dart';

import 'routes.dart';
import 'screens/splash/splash_screen.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.defaultTheme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
