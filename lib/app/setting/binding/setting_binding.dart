import 'package:baseproj/app/setting/controller/setting_controller.dart';
import 'package:get/get.dart';


class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SettingsController());
  }
}