import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one/constants/appBars.dart';
import 'package:one/constants/colors.dart';
import 'package:one/controller/auth_Controller/login_controller.dart';
import 'package:one/screens/auth_screens/signUp_screen.dart';
import 'package:one/screens/bottom_nav_pages/bottom_nav_screen.dart';
import 'package:one/widgets/myTextField.dart';

class LogInScreen extends StatelessWidget {
  var controller = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarAuth,
      body: Obx(
        () => Center(
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                Image.asset(
                  'assets/images/login.png',
                  width: 270,
                  height: 170,
                  fit: BoxFit.contain,
                ),
                Center(
                  child: Text(
                    'LogIn',
                    style: GoogleFonts.aBeeZee(
                        color: Color.fromRGBO(38, 45, 83, 1),
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    'LogIn to continue',
                    style: GoogleFonts.aBeeZee(
                        color: Color.fromRGBO(103, 106, 122, 1), fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 340,
                  height: 390,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 10,
                          blurStyle: BlurStyle.inner,
                          blurRadius: 10,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 20)),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      myTextField(
                        suffixIcon: Icon(Icons.email),
                        secureText: false,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return ' E-mail must be mot null';
                          }
                          return null;
                        },
                        onSave: (val) {
                          controller.myEmail = val!;
                        },
                        errorStyle: TextStyle(
                            color: Colors.red.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                        hintText: 'E-mail',
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(117, 133, 156, 1),
                            fontSize: 16),
                        keyBoardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      myTextField(
                        secureText: controller.isPasswordHidden.value,
                        onSave: (val) {
                          controller.myPassword = val!;
                        },
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(117, 133, 156, 1),
                            fontSize: 16),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.isPasswordHidden.value =
                                !controller.isPasswordHidden.value;
                          },
                          icon: Icon(controller.isPasswordHidden.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        keyBoardType: TextInputType.text,
                        errorStyle: TextStyle(
                            color: Colors.red.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return ' Password must be mot null';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      AnimatedButton(
                        color: authButtonColor,
                        height: 40,
                        pressEvent: () async {
                          UserCredential response = await controller.signIn();
                          if (response != null) {
                            Get.offAll(() => BottomNavScreen(),duration: Duration(seconds: 1),
                              curve: Curves.easeInOutBack,
                              transition: Transition.upToDown,
                              popGesture: true,);
                          }
                        },
                        text: 'LogIn',
                        icon: Icons.login_sharp,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account?',
                            style: GoogleFonts.abel(
                              color: Color.fromRGBO(38, 45, 83, 1),
                              fontSize: 17,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.off(() => RegisterScreen(),duration: Duration(seconds: 2),
                                curve: Curves.easeInOutBack,
                                transition: Transition.zoom,
                                popGesture: true,);
                            },
                            child: Text(
                              ' Register ',
                              style: GoogleFonts.aldrich(
                                  color: Color.fromRGBO(16, 80, 160, 1),
                                  fontSize: 17),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
