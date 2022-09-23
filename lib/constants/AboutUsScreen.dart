import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:one/constants/colors.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white24,
        title: Text(
          'About Us',
          style: GoogleFonts.aclonica(
            color: secondColor,
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  "TEC is an Egyptian multinational technology company which "
                  "focuses on e-commerce, cloud computing, digital streaming, "
                  "and artificial intelligence.",
                  style: GoogleFonts.andikaNewBasic(
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
            ),
            Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  "With TEC, you can enjoy low prices on a wide range of tech products with fast shipping. "
                  "Shop now, click payment, Package tracking. 30 days free returns. Pay in installments.",
                  style: GoogleFonts.andikaNewBasic(
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 55,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Divider(
                  thickness: 4,
                ),
              ),
            ),
            ListTile(
              leading: Text(
                'Contact us :',
                style: GoogleFonts.alegreya(
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              title: Text(
                '01091626965  +0402882448',
                style: GoogleFonts.alegreya(
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    'Our ِِAccounts : ',
                    style: GoogleFonts.alegreya(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.2,
                        ),
                  ),
                  Icon(
                    LineIcons.facebook,
                    color: Color.fromRGBO(66 ,103, 178
                        , 1),
                    size: 60,
                  ),
                  Icon(
                    LineIcons.twitter,
                    color: Color.fromRGBO(	29, 161, 242,1),
                    size: 50,
                  ),
                  Icon(
                    LineIcons.linkedinIn,
                    color: Color.fromRGBO(	14, 118, 168, 1),
                    size: 50,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
