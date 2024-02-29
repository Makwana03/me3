import 'package:get/get.dart';

class IndexChanger extends GetxController {
  Rx<int> selectedRingIndex = 0.obs;
  Rx<int> selectedsizeIndex = 0.obs;

  List<String> ringImages = [
    "assets/images/ring_normal.jpg",
    "assets/images/ring_front.jpg",
    "assets/images/ring_side.jpg",
    "assets/images/ring_top.jpg"
  ];

  List<int> ringSizes = [6, 8, 9, 10, 11];

  changeRingImage(index) {
    selectedRingIndex = index;
  }

  changeRingSize(index2) {
    selectedsizeIndex = index2;
  }
}