import 'package:get/get.dart';

class BottomNavController extends GetxController {
  // Observable for bottom navigation index
  var selectedIndex = 0.obs;

  // Method to change the selected index
  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}

