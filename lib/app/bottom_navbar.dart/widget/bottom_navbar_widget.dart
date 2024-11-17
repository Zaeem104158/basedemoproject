import 'package:baseproj/route/route_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/bottom_navbar_controller.dart';

class BottomNavBar extends GetView<BottomNavController> {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 10,
            currentIndex: controller.selectedIndex.value,
            onTap: (index) {
              controller.changeIndex(index);

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
            items: [
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.home),
              //   label: 'Home',
              // ),
              _buildBottomNavItem(
                icon: Icons.home,
                label: 'Home',
                isSelected: controller.selectedIndex.value == 0,
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.notifications),
              //   label: 'Notifications',
              // ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.settings),
              //   label: 'Settings',
              // ),
              _buildBottomNavItem(
                icon: Icons.notifications,
                label: 'Notifications',
                isSelected: controller.selectedIndex.value == 1,
              ),
              _buildBottomNavItem(
                icon: Icons.settings,
                label: 'Settings',
                isSelected: controller.selectedIndex.value == 2,
              ),
            ],
          ),
        ),
      );
    });
  }

  BottomNavigationBarItem _buildBottomNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: isSelected
            ? BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              )
            : null,
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey,
        ),
      ),
      label: label,
    );
  }
}
