import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TvsController extends GetxController
{
  final List TvProducts = [].obs;
  final firestoreInstance = FirebaseFirestore.instance;
  fetchProductsTvs() async {

    QuerySnapshot qn = await firestoreInstance.collection("Tvs").get();
    for (int i = 0; i < qn.docs.length; i++) {
      TvProducts.add({
        "img": qn.docs[i]["img"],
        "title": qn.docs[i]["title"],
        "price": qn.docs[i]["price"],
      });
    }
    return qn.docs;
  }
  late Future<dynamic> futureTv;

  @override
  void onInit() {
    futureTv =fetchProductsTvs();
    super.onInit();
  }
}