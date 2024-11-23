import 'package:baseproj/app/fee_details/controller/fee_details_controller.dart';
import 'package:get/get.dart';

class FeeDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FeeDetailsController());
  }
}
