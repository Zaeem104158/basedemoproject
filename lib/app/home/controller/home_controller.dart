import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/controller/theme_controller.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;
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
    // Initialize animation controller
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Define the animation (bottom to top)
    animation = Tween<Offset>(
      begin: const Offset(0, 1), // Start off-screen (below)
      end: Offset.zero, // End at the original position
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    // Start the animation
    animationController.forward();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
