import 'package:baseproj/core/theme/controller/theme_controller.dart';
import 'package:get/get.dart';

class ThemeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<ThemeController>(() => ThemeController());

    Get.put(ThemeController());
  }
}
