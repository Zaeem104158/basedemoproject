import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../route/route_service.dart';
import 'bottom_navbar.dart/controller/bottom_navbar_controller.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavController());

    return GetMaterialApp(
      title: 'Bottom Navigation Demo',
      getPages: RouteService.getPages,
    );
  }
}
