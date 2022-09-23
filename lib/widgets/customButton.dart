import 'package:flutter/material.dart';


Widget customButton (String buttonText,onPressed){
  return SizedBox(
    width: 1,
    height: 56,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        elevation: 3,
      ),
      child: Text(
        buttonText,
        style: TextStyle(
            color: Colors.white, fontSize: 18),
      ),
    ),
  );
}