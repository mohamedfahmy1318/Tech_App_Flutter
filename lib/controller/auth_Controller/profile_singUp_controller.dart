import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:one/screens/bottom_nav_pages/bottom_nav_screen.dart';

class ProfileRegisterController extends GetxController {
  final Rx<TextEditingController> nameController = TextEditingController().obs;
  final Rx<TextEditingController> phoneController = TextEditingController().obs;
  final Rx<TextEditingController> genderController = TextEditingController().obs;
  final Rx<TextEditingController> ageController = TextEditingController().obs;

  List<String> gender = ["Male", "Female", "Other"];
  sendUserDataToDB() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;

    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection("users-data");
    return _collectionRef
        .doc(currentUser!.email)
        .set({
      "name":nameController.value.text,
      "phone": phoneController.value.text,
      "age": ageController.value.text,
      "gender": genderController.value.text,
    })
        .then((value) => Get.offAll(BottomNavScreen()))
        .catchError((error) => print("something is wrong. $error"));
  }

}


