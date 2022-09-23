import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one/constants/colors.dart';
import 'package:one/controller/auth_Controller/profile_singUp_controller.dart';
import 'package:one/widgets/myTextField.dart';

class UserForm extends StatelessWidget {
  var controller = Get.put(ProfileRegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Image.asset('assets/images/submit.png'),
                      SizedBox(height: 25,),
                      Text(
                        "Submit the form to continue.",
                        style: TextStyle(fontSize: 22, color: secondColor),
                      ),
                      Text(
                        "We will not share your information with anyone.",
                        style: TextStyle(
                          fontSize: 16,
                          color: secondColor,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      myTextField(
                          hintText: "Enter Your Name",
                          keyBoardType: TextInputType.text,
                          controller: controller.nameController.value,
                          secureText: false),
                      SizedBox(height: 17,),
                      myTextField(
                          hintText: "Enter Your Phone Number",
                          keyBoardType: TextInputType.number,
                          controller: controller.phoneController.value,
                          secureText: false),
                      SizedBox(height: 17,),
                      TextField(
                        controller: controller.genderController.value,
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: "Choose Your Gender",
                          prefixIcon: DropdownButton<String>(
                            items: controller.gender.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                                onTap: () {
                                  controller.genderController.value.text = value;
                                },
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ),
                      ),
                      SizedBox(height: 17,),
                      myTextField(
                          hintText: "Enter Your Age",
                          keyBoardType: TextInputType.number,
                          controller: controller.ageController.value,
                          secureText: false),

                      SizedBox(
                        height: 50,
                      ),

                      // elevated button
                      MaterialButton(
                        textColor: Colors.white,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        onPressed: () => controller.sendUserDataToDB(),
                        color: secondColor,
                        minWidth: 275,
                        height: 50,
                        child: Text("Continue",),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
