import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:one/screens/bottom_nav_pages/HomePage_screen.dart';
import 'package:one/screens/bottom_nav_pages/profile_screen.dart';
import 'package:one/screens/bottom_nav_pages/categories_screen.dart';

class BottomNavController extends GetxController

{
  getUser() {
    FirebaseAuth.instance.currentUser;
  }
  @override
  void onInit() {
    getUser();
    super.onInit();
  }
  final pagesBottomNav = [
    HomePageScreen(),
    CatrgoriesScreen(),
    Profile(),
  ];
  var currentIndex = 0.obs;

  void changePage(int index )
  {
    currentIndex.value = index;
  }
}