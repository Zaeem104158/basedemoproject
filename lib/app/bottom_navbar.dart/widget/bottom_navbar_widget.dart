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
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
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
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBottomNavItem(
                    icon: Icons.home,
                    label: 'Home',
                    isSelected: controller.selectedIndex.value == 0,
                    onTap: () {
                      controller.changeIndex(0);
                      Get.toNamed(RoutePath.home);
                    },
                  ),
                  _buildBottomNavItem(
                    icon: Icons.notifications,
                    label: 'Notifications',
                    isSelected: controller.selectedIndex.value == 1,
                    onTap: () {
                      controller.changeIndex(1);
                      Get.toNamed(RoutePath.notification);
                    },
                  ),
                  _buildBottomNavItem(
                    icon: Icons.grid_view_rounded,
                    label: 'Settings',
                    isSelected: controller.selectedIndex.value == 2,
                    onTap: () {
                      controller.changeIndex(2);
                      Get.toNamed(RoutePath.setting);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildBottomNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
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
          // ShaderMask(
          //   shaderCallback: (bounds) => isSelected
          //       ? const LinearGradient(
          //           colors: [Colors.blue, Colors.purple],
          //           begin: Alignment.topLeft,
          //           end: Alignment.bottomRight,
          //         ).createShader(bounds)
          //       : const LinearGradient(
          //           colors: [Colors.grey, Colors.grey],
          //         ).createShader(bounds),
          //   child: Text(
          //     label,
          //     style: TextStyle(
          //       color: isSelected ? Colors.blue : Colors.grey,
          //       fontSize: 12,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
