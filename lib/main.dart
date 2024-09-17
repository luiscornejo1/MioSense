import 'package:flutter/material.dart';
import 'package:miosense/Views/splash_screen.dart';


void main() {
  runApp(MiosenseApp());
}

class MiosenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
