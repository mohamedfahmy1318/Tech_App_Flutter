import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class LaptopsController extends GetxController {
  final List lapProducts = [].obs;
  fetchProductsLaptops() async {
    final firestoreInstance = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestoreInstance.collection("laptops").get();
    for (int i = 0; i < qn.docs.length; i++) {
      lapProducts.add({
        "img": qn.docs[i]["img"],
        "title": qn.docs[i]["title"],
        "price": qn.docs[i]["price"],
      });
    }
    return qn.docs;
  }

  late Future<dynamic> futureLaps;

  @override
  void onInit() {
   futureLaps= fetchProductsLaptops();
    super.onInit();
  }
}
