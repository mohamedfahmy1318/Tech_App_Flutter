import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one/constants/appBars.dart';
import 'package:one/controller/pages_controller/mobiles_controller.dart';

class MobilesScreen extends StatelessWidget {
  MobilesController controller = Get.put(MobilesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productsAppBar,
      body: GetBuilder(
        builder: (MobilesController controller) => FutureBuilder(
            future: controller.futureMobiles,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                    child: Text(
                  snapshot.error.toString(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ));
              } else {
                return GridView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.mobileProducts.length,
                  itemBuilder: (_, index) {
                    return Card(
                      elevation: 2,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: AspectRatio(
                              aspectRatio: 2,
                              child: Image.network(
                                controller.mobileProducts[index]["img"],
                                fit: BoxFit.contain,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                                "${controller.mobileProducts[index]["title"]}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "${controller.mobileProducts[index]["price"].toString()} \$ ",
                              style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700),
                            ),
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
            }),
      ),
    );
  }
}
