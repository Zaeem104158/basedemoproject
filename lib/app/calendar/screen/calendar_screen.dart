import 'package:baseproj/common_widget/scaffold_appandbottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../route/route_path.dart';
import '../controller/calendar_controller.dart';

class CalendarScreen extends GetView<CalendarController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScaffoldWithAppAndBottomBar(
        showDrawer: false,
        appbarTitle: "Calendar",
        onBackRoute: RoutePath.home,
        child: Container());
  }
}
