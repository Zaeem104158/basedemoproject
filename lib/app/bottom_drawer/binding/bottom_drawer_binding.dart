import 'package:baseproj/app/bottom_drawer/controller/bottom_drawer_controller.dart';
import 'package:get/get.dart';

class BottomDrawerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomDrawerController());
  }
}
