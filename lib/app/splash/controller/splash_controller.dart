import 'dart:developer';

import 'package:baseproj/core/storage_service/app_storage.dart';
import 'package:get/get.dart';
import '../../../core/route/route_path.dart';

class SplashController extends GetxController {
  final AppStorage appStorage = AppStorage();
  bool onboardingSeen = false, loggedIn = false;
  @override
  void onInit() async {
    onboardingSeen = await checkOnboardingSeen();
    loggedIn = await checkLoggedIn();

    Future.delayed(const Duration(seconds: 3), () => redirect());
    super.onInit();
  }

  redirect() {
    // Get.offAllNamed(RoutePath.login);
    if (onboardingSeen == true && loggedIn == true) {
      Get.offAllNamed(RoutePath.home);
    } else if (onboardingSeen == true && loggedIn == false) {
      Get.offAllNamed(RoutePath.login);
    } else {
      Get.offAllNamed(RoutePath.onboarding);
    }
  }

  Future<bool> checkOnboardingSeen() async {
    return await appStorage.read(AppStorageKeys.hasSeenOnboarding) ?? false;
  }

  Future<bool> checkLoggedIn() async {
    return await appStorage.read(AppStorageKeys.loggedIn) ?? false;
  }
}
