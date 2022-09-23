import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one/constants/AboutUsScreen.dart';
import 'package:one/constants/devolped_by_screen.dart';
import 'package:one/screens/auth_screens/logIn_screen.dart';

Drawer myDrawer = Drawer(
  child: Column(
    children: [
      DrawerHeader(
        child: Image.asset('assets/images/man.png'),
      ),
      SizedBox(
        height: 40,
      ),
      Card(
        elevation: 8,
        child: ListTile(
          onTap: () {
            Get.to(
              AboutUsScreen(),
              duration: Duration(seconds: 1),
              curve: Curves.easeInOutExpo,
              transition: Transition.upToDown,
              popGesture: true,
            );
          },
          leading: Icon(
            Icons.help,
            size: 30,
          ),
          title: Text(
            'About Us',
            style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 25,
      ),
      Card(
        elevation: 8,
        child: ListTile(
          onTap: () {
            Get.to(
              DevlopedBy(),
              duration: Duration(seconds: 1),
              curve: Curves.easeInOutExpo,
              transition: Transition.upToDown,
              popGesture: true,
            );
          },
          leading: Icon(
            Icons.people_alt_outlined,
            size: 30,
          ),
          title: Text(
            'Developed By',
            style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 25,
      ),
      Card(
        elevation: 8,
        child: ListTile(
          onTap: () {
            Get.changeTheme(
              Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
            );
          },
          leading: Icon(
            Icons.brightness_4_outlined,
            size: 30,
          ),
          title: Text(
            'Change Mode',
            style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 70,
      ),
      Card(
        elevation: 8,
        child: ListTile(
          onTap: () async {
            await FirebaseAuth.instance.signOut();
            Get.off(
              () => LogInScreen(),
              duration: Duration(seconds: 2),
              curve: Curves.easeInOutBack,
              transition: Transition.upToDown,
              popGesture: true,
            );
          },
          leading: Icon(
            Icons.output,
            size: 30,
          ),
          title: Text(
            'Sign Out',
            style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
        ),
      ),
    ],
  ),
);
