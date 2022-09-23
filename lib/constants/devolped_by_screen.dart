import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one/constants/appBars.dart';
import 'package:one/constants/colors.dart';

class DevlopedBy extends StatelessWidget {
  const DevlopedBy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> names = [
      'Omnia Mohamed Elsersawy',
      'Mohamed Mohamed Fahmy',
      'Aya Mohamed Mahmoud',
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white24,
        title: Text(
          'Our Team',
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
            icon: Icon(Icons.arrow_back_ios_new,color: secondColor,size: 35,)),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => Card(
                elevation: 10,
                child: ListTile(
                  leading: Text(
                    'ENG :',
                    style: GoogleFonts.adamina(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                       ),
                  ),
                  title: Text(
                    names[index],
                    style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
          separatorBuilder: (context, index) => SizedBox(height: 60),
          itemCount: names.length),
    );
  }
}
