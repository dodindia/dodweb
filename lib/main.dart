import 'package:dod_web/utils/Color_constants/colorconstants.dart';
import 'package:dod_web/view/Splash_Screen/splash_screen.dart';
import 'package:dod_web/view/home_Screen/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
