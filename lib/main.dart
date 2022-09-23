import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:one/constants/colors.dart';
import 'package:one/constants/utlis/bindings.dart';
import 'package:one/screens/intro_screens/Splash-Screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MyBindning(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(229, 229, 229, 1),
      ),
      darkTheme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey.shade700,
          selectedIconTheme:IconThemeData(color: Colors.white),
          selectedItemColor: Colors.indigo
        )
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
