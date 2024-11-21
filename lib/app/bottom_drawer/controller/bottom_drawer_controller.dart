import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomDrawerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;
  @override
  void onInit() {
    super.onInit();

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
