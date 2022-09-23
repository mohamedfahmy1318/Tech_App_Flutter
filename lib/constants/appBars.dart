import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

AppBar appBarAuth = AppBar(
  backgroundColor: Color.fromRGBO(229, 229, 229, 1),
  elevation: 0.0,
  actions: const [
    Padding(
      padding: EdgeInsets.all(10.0),
      child: Icon(
        Icons.qr_code,
        color: Colors.black,
      ),
    )
  ],
);
AppBar productsAppBar = AppBar(
  centerTitle: true,
  elevation: 0.0,
  backgroundColor: Colors.white24,
  title: Text(
    'Tech Shop',
    style: GoogleFonts.aclonica(
      color: primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 35,
    ),
  ),
  leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: secondColor,
        size: 35,
      )),
);
AppBar BottomNavAppBar = AppBar(
  centerTitle: true,
  elevation: 0.0,
  backgroundColor: Colors.white24,
  title: Text(
    'Tech Shop',
    style: GoogleFonts.aclonica(
      color: primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 35,
    ),
  ),
);

