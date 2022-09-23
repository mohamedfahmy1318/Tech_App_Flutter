import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final firestoreInstance = FirebaseFirestore.instance;
  final RxList carouselImages = [].obs;
  final List products = [].obs;
  var dotPosition = 0.obs;

  fetchImageSlider() async {
    QuerySnapshot qn = await firestoreInstance.collection("image-slider").get();

    for (int i = 0; i < qn.docs.length; i++) {
      carouselImages.add(
        qn.docs[i]["image-path"],
      );
    }

    return qn.docs;
  }

  fetchProducts() async {
    QuerySnapshot qn = await firestoreInstance.collection("products").get();

    for (int i = 0; i < qn.docs.length; i++) {
      products.add({
        "product-name": qn.docs[i]["product-name"],
        "product-description": qn.docs[i]["product-description"],
        "product-price": qn.docs[i]["product-price"],
        "product-img": qn.docs[i]["product-img"],
      });
    }

    return qn.docs;
  }

  void changePageCarousel(val,carouselPageChangedReason){
    dotPosition.value =val;
  }
  late Future<dynamic> future;
  @override
  void onInit() {
    future= fetchImageSlider();
    future=fetchProducts();
    super.onInit();
  }
}
