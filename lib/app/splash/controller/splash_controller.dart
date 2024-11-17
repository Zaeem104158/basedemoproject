import 'package:get/get.dart';
import '../../../route/route_path.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
        const Duration(seconds: 3), () => Get.offAllNamed(RoutePath.home));
    super.onInit();
  }
}
