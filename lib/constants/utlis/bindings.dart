import 'package:get/get.dart';
import 'package:one/controller/Botto_Nav_Controller/UserDetails_controller.dart';
import 'package:one/controller/Botto_Nav_Controller/bottom_nav_controller.dart';
import 'package:one/controller/Botto_Nav_Controller/categories_controller.dart';
import 'package:one/controller/auth_Controller/Register_controller.dart';
import 'package:one/controller/auth_Controller/login_controller.dart';
import 'package:one/controller/auth_Controller/profile_singUp_controller.dart';
import 'package:one/controller/pages_controller/HomePage_Controller.dart';
import 'package:one/controller/pages_controller/laptops_controller.dart';
import 'package:one/controller/pages_controller/mobiles_controller.dart';
import 'package:one/controller/pages_controller/other_devices_controller.dart';
import 'package:one/controller/pages_controller/tvs_controller.dart';

class MyBindning implements Bindings
{
  @override
  void dependencies() {
    Get.put(LogInController());
    Get.put(RegisterController());
    Get.put(HomePageController());
    Get.put(MobilesController());
  Get.put(CategoriesController());
  Get.put(ProfileRegisterController());
  Get.put(UserDetailsController(),permanent: true);
  Get.put(TvsController());
  Get.put(OtherDevicesController());
  Get.put(LaptopsController());
  Get.put(BottomNavController());

  }

}