import 'package:baseproj/app/calendar/controller/calendar_controller.dart';
import 'package:get/get.dart';

class CalendarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CalendarController());
  }
}