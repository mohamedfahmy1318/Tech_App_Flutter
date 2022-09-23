import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one/constants/colors.dart';

class LogInController extends GetxController {
  late UserCredential userCredential;
  late String myEmail, myPassword;
  RxBool isPasswordHidden = true.obs;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  signIn() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: myEmail, password: myPassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar(
            'Error',
            'user Not Valid',
            duration: Duration(seconds: 2),
            backgroundColor: Colors.deepPurple,
            snackPosition: SnackPosition.BOTTOM,
            icon: Icon(Icons.error_rounded),
            padding: EdgeInsets.all(10),
            colorText: Colors.white,
            snackStyle: SnackStyle.GROUNDED,
          );
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
            'Error',
            'password Not Valid',
            duration: Duration(seconds: 2),
            backgroundColor: secondColor,
            snackPosition: SnackPosition.BOTTOM,
            icon: Icon(Icons.error_rounded),
            colorText: Colors.white,
            snackStyle: SnackStyle.GROUNDED,
          );
        }
      }
    } else {
      Get.snackbar(
        'Error',
        'Not Valid',
        duration: Duration(seconds: 2),
        backgroundColor: Colors.grey.shade600,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.GROUNDED,
        icon: Icon(Icons.error),
        padding: EdgeInsets.all(10),
        colorText: Colors.white,
      );
    }
  }
}
