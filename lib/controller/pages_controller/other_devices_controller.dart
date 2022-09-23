import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class OtherDevicesController extends GetxController
{
  final List devicesProducts = [].obs;
  final firestoreInstance = FirebaseFirestore.instance;
  fetchProductsDevices() async {

    QuerySnapshot qn = await firestoreInstance.collection("others devices").get();
    for (int i = 0; i < qn.docs.length; i++) {
      devicesProducts.add({
        "img": qn.docs[i]["img"],
        "title": qn.docs[i]["title"],
        "price": qn.docs[i]["price"],
      });
    }
    return qn.docs;

  }
  late Future<dynamic> futureOther;

  @override
  void onInit() {
   futureOther= fetchProductsDevices();
    super.onInit();
  }
}