import 'package:flutter/material.dart';

class Colorconstants {
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  static const Color transparent = Colors.transparent;
  static const Color mainBlue = Color(0xff122450);
  static const Color mainBlueop = Color(0x80122450);
  static const Color lightBlue = Color(0xffE3EDED);
  static const Color pineBlack = Color(0xff2E2B2B);
  static const Color maingrey = Color(0xffD9D9D9);
  static const Color softOrange = Color(0xffF6C688);
  static const Color red = Colors.red;

  static const Gradient bluegrad = LinearGradient(
    colors: [mainBlue, lightBlue],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const Gradient mobreview = LinearGradient(
    colors: [mainBlue, mainBlue, mainBlueop],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
