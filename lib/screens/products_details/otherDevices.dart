import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one/constants/appBars.dart';
import 'package:one/controller/pages_controller/other_devices_controller.dart';

class OtherDevicesScreen extends StatelessWidget {
  OtherDevicesController controller = Get.put(OtherDevicesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productsAppBar,
      body: GetBuilder(
        builder: (OtherDevicesController controller) => FutureBuilder(
          future: controller.futureOther,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return GridView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: controller.devicesProducts.length,
                itemBuilder: (_, index) {
                  return Card(
                    elevation: 8,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: AspectRatio(
                            aspectRatio: 2,
                            child: Image.network(
                              controller.devicesProducts[index]["img"],
                              fit: BoxFit.contain,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                              "${controller.devicesProducts[index]["title"]}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 20)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "${controller.devicesProducts[index]["price"].toString()} \$ ",
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
          },
        ),
      ),
    );
  }
}
