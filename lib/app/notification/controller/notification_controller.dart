import 'dart:developer';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  RxString previousRoute = "".obs;
  @override
  void onInit() {
    var data = Get.arguments;
    if (data != null) {
      previousRoute.value = data;
      log("message--- $previousRoute");
    }
    super.onInit();
  }
}
