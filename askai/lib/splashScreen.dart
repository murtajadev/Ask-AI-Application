import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:askai/homePage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double hightScreen = MediaQuery.of(context).size.height;
    return AnimatedSplashScreen(
      splash:
          Center(child: LottieBuilder.asset("asset/Lottlie/Animation_AI.json")),
      backgroundColor: Colors.white,
      splashIconSize: hightScreen / 3,
      duration: 2000,
      nextScreen: const HomePage(),
    );
  }
}
