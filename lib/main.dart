import 'package:coffee_management/features/intro/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
    );
  }
}
