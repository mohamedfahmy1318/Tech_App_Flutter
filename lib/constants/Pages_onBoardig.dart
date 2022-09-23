import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:one/constants/colors.dart';

final pages = [
  PageModel(
      color: primaryColor,
      imageAssetPath: 'assets/images/screen1.png',
      title: 'WELCOME!',
      body: 'Hello To Our Application',
      doAnimateImage: true),
  PageModel(
      color: primaryColor,
      imageAssetPath: 'assets/images/screen2.png',
      title: 'Our Products',
      body: 'We have all the technology products ',
      doAnimateImage: true),
  PageModel(
      color: primaryColor,
      imageAssetPath: 'assets/images/screen3.png',
      title: 'quick shopping',
      body: 'you can shop easily and fast',
      doAnimateImage: true),
];