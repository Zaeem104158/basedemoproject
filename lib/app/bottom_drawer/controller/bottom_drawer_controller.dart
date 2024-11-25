
import 'package:get/get.dart';

class BottomDrawerController extends GetxController
   {

  RxString previousRoute = "".obs;
  @override
  void onInit() {
    super.onInit();
    var data = Get.arguments;
    if (data != null) {
      previousRoute.value = data[0];
    }
    // Initialize animation controller
   
  }

  @override
  void onClose() {
    super.onClose();
  }
}
