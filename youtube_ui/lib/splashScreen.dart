import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:youtube_ui/homePage/homePage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: LottieBuilder.asset("assets/Lottie/introYouTube.json"),
      ),
      nextScreen: const HomePage(),
      duration: 2500,
      splashIconSize: MediaQuery.of(context).size.width / 1.5,
      backgroundColor: Colors.black,
    );
  }
}
