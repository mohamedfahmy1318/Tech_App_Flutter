import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one/constants/appBars.dart';
import 'package:one/controller/Botto_Nav_Controller/categories_controller.dart';

class CatrgoriesScreen extends StatelessWidget {
  var controller = Get.put(CategoriesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BottomNavAppBar,
      body: ListView.separated(
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Get.to(
                    controller.productsPages[index],
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOutBack,
                    transition: Transition.upToDown,
                    popGesture: true,
                  );
                },
                child: Card(
                  elevation: 19,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        '${controller.images[index]}',
                        width: 140,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                      Spacer(flex: 2),
                      Text(
                        controller.titles[index],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Spacer(flex: 2),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(Icons.arrow_forward),
                      )
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
          itemCount: controller.titles.length),
    );
  }
}
