import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one/constants/colors.dart';
import 'package:one/controller/Botto_Nav_Controller/bottom_nav_controller.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavController controller = Get.put(BottomNavController());
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          key: _bottomNavigationKey,
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.bounceInOut,
          animationDuration: Duration(seconds: 1),
          items: [
            Icon(Icons.home,color: secondColor),
            Icon(Icons.category_sharp,color: secondColor),
            Icon(Icons.person,color: secondColor),
          ],
          height: 60,
          index: controller.currentIndex.value,
          onTap: (index) {
            controller.changePage(index);
          },
        ),
      ),
      body: Obx(() => controller.pagesBottomNav[controller.currentIndex.value]),
    );
  }
}
