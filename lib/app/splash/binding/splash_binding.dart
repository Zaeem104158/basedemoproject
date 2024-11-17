import 'package:baseproj/app/splash/controller/splash_controller.dart';
import 'package:get/instance_manager.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
