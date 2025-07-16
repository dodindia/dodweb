import 'dart:async';
import 'package:dod_web/utils/Color_constants/colorconstants.dart';
import 'package:dod_web/utils/Image_constants/imageconstants.dart';
import 'package:dod_web/view/home_Screen/homeScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  late AnimationController _zoomInController;
  late Animation<double> _zoomInAnimation;

  bool showSecondImage = false;

  @override
  void initState() {
    super.initState();

    // Rotation controller
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    _rotationAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 50),
    ]).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.easeInOut),
    );

    _rotationController.forward();

    // Zoom-in controller for 2nd image
    _zoomInController = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    );

    _zoomInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _zoomInController, curve: Curves.easeOutBack),
    );

    // Show 2nd image after rotation completes
    Future.delayed(const Duration(milliseconds: 2500), () {
      setState(() {
        showSecondImage = true;
      });
      _zoomInController.forward();
    });

    // Navigate to HomeScreen after 6 seconds
    Future.delayed(const Duration(milliseconds: 6000), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Homescreen()),
      );
    });
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _zoomInController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colorconstants.mainBlue,
      body: Center(child: _buildSplashImage(screenHeight)),
    );
  }

  Widget _buildSplashImage(double height) {
    if (showSecondImage) {
      return AnimatedBuilder(
        animation: _zoomInController,
        builder: (context, child) {
          return Transform.scale(
            scale: _zoomInAnimation.value,
            child: Image.asset(Imageconstants.foot_logo, height: height / 10),
          );
        },
      );
    } else {
      return AnimatedBuilder(
        animation: _rotationController,
        builder: (context, child) {
          return Transform.rotate(
            angle: _rotationAnimation.value * 3.14 * 2,
            child: Image.asset(
              Imageconstants.steering_orange,
              height: height / 10,
            ),
          );
        },
      );
    }
  }
}
