import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one/constants/appBars.dart';
import 'package:one/controller/auth_Controller/Register_controller.dart';
import 'package:one/screens/auth_screens/logIn_screen.dart';
import 'package:one/screens/auth_screens/profile_screen_submit.dart';
import 'package:one/widgets/myTextField.dart';

class RegisterScreen extends StatelessWidget {
  var controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarAuth,
      body: Obx(() => Center(
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  Image.asset(
                    'assets/images/register.png',
                    width: 300,
                    height: 170,
                    fit: BoxFit.contain,
                  ),
                  Center(
                    child: Text(
                      'Register',
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
                      'Register to continue',
                      style: GoogleFonts.aBeeZee(
                          color: Color.fromRGBO(103, 106, 122, 1),
                          fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 340,
                    height: 370,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white,
                            spreadRadius: 15,
                            blurStyle: BlurStyle.solid,
                            blurRadius: 20,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 20)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                          height: 35,
                        ),
                        AnimatedButton(
                          color: Color.fromRGBO(243, 1, 0, 1),
                          height: 40,
                          pressEvent: () async {
                            UserCredential response = await controller.signUp();
                            if (response != null) {
                              Get.to(
                                () => UserForm(),
                                duration: Duration(milliseconds: 900),
                                curve: Curves.easeInOutBack,
                                transition: Transition.upToDown,
                                popGesture: true,
                              );
                            }
                          },
                          text: 'Continue',
                          icon: Icons.logout_sharp,
                        ),
                        Row(
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
                                Get.offAll(() => LogInScreen(),duration: Duration(seconds: 2),
                                  curve: Curves.easeInOutBack,
                                  transition: Transition.rightToLeftWithFade,
                                  popGesture: true,);
                              },
                              child: Text(
                                ' LogIn ',
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
          )),
    );
  }
}
