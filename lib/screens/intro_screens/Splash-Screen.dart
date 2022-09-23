import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:one/constants/colors.dart';
import 'package:one/screens/intro_screens/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Lottie.asset('assets/images/splahphoto2.json', animate: true),
          SizedBox(
            height: 30,
          ),
          Text(
            'TECH SHOP',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )
        ],
      ),
      splashIconSize: 420,
      splashTransition: SplashTransition.fadeTransition,
      curve: Curves.bounceInOut,
      animationDuration: Duration(seconds: 2),
      nextScreen:  Onboarding(),
      backgroundColor: secondColor,
      centered: true,
    );
  }
}
