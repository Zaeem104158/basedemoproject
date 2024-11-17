import 'package:baseproj/app/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_widget/scaffold_appandbottomnavbar.dart';


class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBottomBar(
        showDrawer: true,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/result');
                },
                child: const Text('Go to Result'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/dairy');
                },
                child: const Text('Go to Dairy'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/photo');
                },
                child: const Text('Go to Photo'),
              ),
            ],
          ),
        ));
  }
}
