import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/controller/theme_controller.dart';

class HomeController extends GetxController {
  RxString previousRoute = "".obs;
  late ThemeController themeController;

  @override
  void onInit() {
    themeController = Get.put(ThemeController());
    super.onInit();
    var data = Get.arguments;
    if (data != null) {
      previousRoute.value = data[0];
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
