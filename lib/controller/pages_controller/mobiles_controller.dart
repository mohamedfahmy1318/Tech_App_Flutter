import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MobilesController extends GetxController {
  final List mobileProducts = [].obs;
  fetchProductsMobiles() async {
    final firestoreInstance = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestoreInstance.collection("mobiles").get();
    for (int i = 0; i < qn.docs.length; i++) {
      mobileProducts.add({
        "img": qn.docs[i]["img"],
        "title": qn.docs[i]["title"],
        "price": qn.docs[i]["price"],
      });
    }
    return qn.docs;
  }
  late Future<dynamic> futureMobiles;

  @override
  void onInit() {
    futureMobiles=fetchProductsMobiles();
    super.onInit();
  }
}
