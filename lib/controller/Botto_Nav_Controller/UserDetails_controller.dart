
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetailsController extends GetxController {


  setDataToTextField(data) {
    return ListView(
      physics:BouncingScrollPhysics(),

      children: [
        Image.asset('assets/images/man.png',width: 280,height: 250,filterQuality: FilterQuality.high,fit: BoxFit.contain),
        Card(
          elevation: 8,
          child: ListTile(
            leading: Text(
              'User Name:',
              style: GoogleFonts.adamina(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            title: Text(
              data["name"],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.w600,
                fontSize: 19,
              ),
            ),
            trailing: Icon(Icons.person),
          ),
        ),
        SizedBox(height: 15,),
        Card(
          elevation: 8,
          child: ListTile(
            leading: Text(
              'Phone :',
              style: GoogleFonts.adamina(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            title: Text(
              data["phone"],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            trailing: Icon(Icons.phone_android),
          ),
        ),
        SizedBox(height: 15,),
        Card(
          elevation: 8,
          child: ListTile(
            leading: Text(
              'Age :',
              style: GoogleFonts.adamina(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            title: Text(
              data["age"],
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            trailing: Icon(Icons.calendar_month),
          ),
        ),
        SizedBox(height: 15,),
        Card(
          elevation: 8,
          child: ListTile(
            leading: Text(
              'Gender :',
              style: GoogleFonts.adamina(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            title: Text(
              data["gender"],
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            trailing: Icon(Icons.man),
          ),
        ),

      ],
    );
  }
}
