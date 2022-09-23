import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one/constants/Drawer.dart';
import 'package:one/constants/appBars.dart';
import 'package:one/controller/pages_controller/HomePage_Controller.dart';
import 'package:one/screens/products_details/product_details_screen.dart';

import '../../constants/colors.dart';

class HomePageScreen extends StatelessWidget {
  var controller = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BottomNavAppBar,
      drawer: myDrawer,
      body: GetBuilder(
        builder: (HomePageController controller) => Column(
          children: [
            SizedBox(
              height: 25,
            ),
            FutureBuilder(
              future: controller.future,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: secondColor,
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return AspectRatio(
                    aspectRatio: 2.3,
                    child: CarouselSlider(
                      items: controller.carouselImages
                          .map((item) => Padding(
                                padding:
                                    const EdgeInsets.only(left: 3, right: 3),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        filterQuality: FilterQuality.high,
                                        image: NetworkImage(item),
                                        fit: BoxFit.fitWidth),
                                  ),
                                ),
                              ))
                          .toList(),
                      options: CarouselOptions(
                          autoPlay: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 900),
                          autoPlayCurve: Curves.easeInCirc,
                          autoPlayInterval: Duration(seconds: 3),
                          enlargeCenterPage: true,
                          viewportFraction: 0.8,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          onPageChanged: (val, carouselPageChangedReason) {
                            controller.changePageCarousel(
                                val, carouselPageChangedReason);
                          }),
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            DotsIndicator(
              dotsCount: controller.carouselImages.length == 0
                  ? 1
                  : controller.carouselImages.length,
              position: controller.dotPosition.toDouble(),
              decorator: DotsDecorator(
                activeColor: primaryColor,
                color: Colors.white,
                spacing: EdgeInsets.all(2),
                activeSize: Size(8, 8),
                size: Size(6, 6),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Best Sales',
                style: GoogleFonts.aBeeZee(
                    fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: controller.future,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(color: secondColor),
                  );
                }
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return Expanded(
                    child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 8,
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                () =>
                                    ProductDetails(controller.products[index]),
                                duration: Duration(seconds: 2),
                                curve: Curves.easeInOutBack,
                                transition: Transition.leftToRightWithFade,
                                popGesture: true,
                              );
                            },
                            child: Card(
                              elevation: 10,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: AspectRatio(
                                      aspectRatio: 2,
                                      child: Image.network(
                                        controller.products[index]
                                            ["product-img"][0],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                      "${controller.products[index]["product-name"]}",
                                      style: TextStyle(fontSize: 19)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "${controller.products[index]["product-price"].toString()} \$ ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                  ;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
