import 'package:baseproj/app/bottom_navbar.dart/controller/bottom_navbar_controller.dart';
import 'package:get/get.dart';

class BottomNavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}
