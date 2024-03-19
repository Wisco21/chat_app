import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:lottie/lottie.dart';

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({super.key});
  get splash => null;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash:
        Column(children: [
        ]),
         nextScreen: const HomePage());
  }
}
