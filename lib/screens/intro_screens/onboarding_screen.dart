import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:get/get.dart';
import 'package:one/constants/Pages_onBoardig.dart';
import 'package:one/screens/auth_screens/logIn_screen.dart';
import 'package:one/screens/bottom_nav_pages/bottom_nav_screen.dart';

class Onboarding extends StatelessWidget {
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        allowScroll: true,
        pages: pages,
        showBullets: true,
        inactiveBulletColor: Color.fromRGBO(200, 120, 50, 1),
        skipCallback: () {
          if (user == null) {
            Get.off(
              () => LogInScreen(),
              duration: Duration(seconds: 3),
              curve: Curves.easeInOutBack,
              transition: Transition.zoom,
              popGesture: true,
            );
          } else {
            Get.off(
              BottomNavScreen(),
              duration: Duration(milliseconds: 700),
              curve: Curves.easeInOutBack,
              transition: Transition.downToUp,
              popGesture: true,
            );
          }
        },
        finishCallback: () {
          if (user == null) {
            Get.off(
              () => LogInScreen(),
              duration: Duration(seconds: 3),
              curve: Curves.easeInOutBack,
              transition: Transition.zoom,
              popGesture: true,
            );
          } else {
            Get.off(
              BottomNavScreen(),
              duration: Duration(milliseconds: 700),
              curve: Curves.easeInOutBack,
              transition: Transition.downToUp,
              popGesture: true,
            );
          }
        },
      ),
    );
  }
}
