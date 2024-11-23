import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_widget/scaffold_appandbottomnavbar.dart';
import '../controller/notification_controller.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWithAppAndBottomBar(
      appbarTitle: "Notifications",
      showDrawer: true,
      //onBackRoute: controller.previousRoute.value,
      child: Center(
        child: Text('Notification Screen'),
      ),
    );
  }
}
