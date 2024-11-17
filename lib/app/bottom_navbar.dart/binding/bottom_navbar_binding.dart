import 'package:baseproj/app/bottom_navbar.dart/controller/bottom_navbar_controller.dart';
import 'package:get/get.dart';

class BottomNavbarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
  }
}
