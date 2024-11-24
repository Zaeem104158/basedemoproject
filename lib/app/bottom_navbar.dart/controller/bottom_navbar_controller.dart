import 'dart:developer';

import 'package:get/get.dart';

import '../../../core/route/route_path.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;
  @override
  void onInit() {
    log("BottomNAVBAR");
    super.onInit();
  }

  void changeIndex(int index) {
    switch (index) {
      case 0:
        {
          selectedIndex.value = 0;
          Get.offAllNamed(
            RoutePath.home,
          );
        }
      case 1:
        {
          selectedIndex.value = 1;
          Get.offAllNamed(
            RoutePath.notification,
          );
        }
      case 2:
        {
          selectedIndex.value = 2;
          Get.offAllNamed(
            RoutePath.bottomDrawer,
          );
        }
    }
  }
}
