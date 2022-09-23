import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one/constants/appBars.dart';
import 'package:one/constants/colors.dart';
import 'package:one/controller/pages_controller/tvs_controller.dart';

class TvsScreen extends StatelessWidget {
  TvsController controller = Get.put(TvsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productsAppBar,
      body: GetBuilder(
        builder: (TvsController controller) => FutureBuilder(
          future: controller.futureTv,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: secondColor),
              );
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return GridView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: controller.TvProducts.length,
                itemBuilder: (_, index) {
                  return Card(
                    elevation: 8,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: AspectRatio(
                            aspectRatio: 2,
                            child: Image.network(
                              controller.TvProducts[index]["img"],
                              fit: BoxFit.contain,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "${controller.TvProducts[index]["title"]}",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${controller.TvProducts[index]["price"].toString()} \$ ",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 8,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
