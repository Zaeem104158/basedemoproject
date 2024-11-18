import 'package:baseproj/app/setting/controller/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_widget/scaffold_appandbottomnavbar.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWithBottomBar(
        appbarTitle: "Settings",
        showDrawer: true,
        child: Center(child: Text('Setting Screen')));
  }
}
