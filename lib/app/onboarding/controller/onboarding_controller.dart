import 'dart:developer';

import 'package:baseproj/core/storage_service/app_storage.dart';
import 'package:baseproj/core/utility/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/route/route_path.dart';

class OnboardingController extends GetxController {
  late PageController pageController;
  final AppStorage appStorage = AppStorage();
  final List<Map<String, String>> onboardingData = [
    {"image": ImagePath.onboardingImage1, "title": "Welcome to the App!"},
    {
      "image": ImagePath.onboardingImage2,
      "title": "Learn to use the features."
    },
    {"image": ImagePath.onboardingImage3, "title": "Enjoy the experience!"},
  ];
  final currentPageIndex = 0.obs;

  @override
  void onInit() {
    pageController = PageController()
      ..addListener(() {
        // Update the current page index whenever the page changes
        currentPageIndex.value = pageController.page?.round() ?? 0;
      });
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void gotoNext() {
    if (pageController.hasClients) {
      if (currentPageIndex.value == onboardingData.length - 1) {
        appStorage.write(AppStorageKeys.hasSeenOnboarding, true);
        Get.offAllNamed(RoutePath.login);
      } else {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void gotoPrevious() {
    if (pageController.hasClients) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
