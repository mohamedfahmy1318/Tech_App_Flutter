import 'package:get/get.dart';
import 'package:one/screens/products_details/MobilesScreen.dart';
import 'package:one/screens/products_details/laptopsscreen.dart';
import 'package:one/screens/products_details/otherDevices.dart';
import 'package:one/screens/products_details/tvscreen.dart';

class CategoriesController extends GetxController
{
  List<String> titles = [
    'mobiles',
    'LapTops',
    'Televisions',
    'Other Devices'
  ] ;
  List images =[
    'assets/images/phone.png',
    'assets/images/laptoops.png',
    'assets/images/tvj.jpg',
    'assets/images/otherdevices.png',

  ];
  List productsPages =
  [
    MobilesScreen(),
    LaptopsScreen(),
    TvsScreen(),
    OtherDevicesScreen(),
  ];
}