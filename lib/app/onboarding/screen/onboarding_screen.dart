import 'package:baseproj/app/onboarding/controller/onboarding_controller.dart';
import 'package:baseproj/core/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: controller.onboardingData.length,
              itemBuilder: (context, index) {
                final item = controller.onboardingData[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      item['image']!,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      item['title']!,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Visibility(
                    visible: controller.currentPageIndex.value != 0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor, // background
                        foregroundColor: Colors.white, // foreground
                      ),
                      onPressed: () => controller.gotoPrevious(),
                      child: const Text("Previous"),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor, // background
                    foregroundColor: Colors.white, // foreground
                  ),
                  onPressed: () => controller.gotoNext(),
                  child: const Text("Next"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
