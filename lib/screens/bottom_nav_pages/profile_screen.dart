import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one/constants/appBars.dart';
import 'package:one/controller/Botto_Nav_Controller/UserDetails_controller.dart';

class Profile extends StatelessWidget {
  var controller = Get.put(UserDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BottomNavAppBar,
      body: GetBuilder<UserDetailsController>(
        builder: (controller) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users-data")
                  .doc(FirebaseAuth.instance.currentUser!.email)
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                var data = snapshot.data;
                if (data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return controller.setDataToTextField(data);
              },
            ),
          ),
        ),
      ),
    );
  }
}
