import 'package:findyourcure/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class WelcomeScreen extends StatelessWidget {

  static const String id = "welcome_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
          backgroundColor: Color(0xff846db6),
          splash: Image.asset(
            'images/icone.png',
            color: Colors.white,
          ),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          nextScreen: HomeScreen()
        ),
      );
  }
}
