import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late UserCredential userCredential;
  late String myEmail, myPassword;
  RxBool isPasswordHidden = true.obs;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: myEmail,
          password: myPassword,
        );
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar(
            'Error',
            'Password Too Weak',
            duration: Duration(seconds: 2),
            backgroundColor: Colors.deepPurple,
            snackPosition: SnackPosition.BOTTOM,
            icon: Icon(Icons.error_rounded),
            padding: EdgeInsets.all(10),
            colorText: Colors.white,
            snackStyle: SnackStyle.GROUNDED,
          );
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar(
            'Error',
            'account already exists for that email',
            duration: Duration(seconds: 2),
            backgroundColor: Colors.deepPurple,
            snackPosition: SnackPosition.BOTTOM,
            icon: Icon(Icons.error_rounded),
            padding: EdgeInsets.all(10),
            colorText: Colors.white,
            snackStyle: SnackStyle.GROUNDED,
          );
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      Get.snackbar(
        'Error',
        'Not Valid',
        duration: Duration(seconds: 2),
        backgroundColor: Colors.grey.shade600,
        snackPosition: SnackPosition.BOTTOM,
        icon: Icon(Icons.error_outlined),
        padding: EdgeInsets.all(10),
        borderRadius: 20,
        colorText: Colors.white,
        snackStyle: SnackStyle.GROUNDED,
      );
    }
  }
}
