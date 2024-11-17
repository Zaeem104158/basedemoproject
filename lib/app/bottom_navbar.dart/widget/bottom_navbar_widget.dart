import 'package:baseproj/route/route_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bottom_navbar_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
  
    final BottomNavController controller = Get.find();

    return Obx(() {
      return BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: (index) {
          controller.changeIndex(index);
          // Navigate based on index
          switch (index) {
            case 0:
              Get.offAllNamed(RoutePath.home);
              break;
            case 1:
              Get.offAllNamed(RoutePath.notification);
              break;
            case 2:
              Get.offAllNamed(RoutePath.setting);
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      );
    });
  }
}
