import 'package:baseproj/app/bottom_drawer/controller/bottom_drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_widget/custome_text.dart';
import '../../../common_widget/scaffold_appandbottomnavbar.dart';
import '../../../core/route/route_path.dart';
import '../../drawer/custome_drawer.dart';

class BottomDrawer extends GetView<BottomDrawerController> {
  const BottomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppAndBottomBar(
      appbarTitle: "Drawer",
      showDrawer: true,
      bottombarIndex: 2,
      //onBackRoute: controller.previousRoute.value,
      child: SlideTransition(
        position: controller.animation,
        child: GridView.builder(
          padding: const EdgeInsets.only(left: 16.0, right: 16, top: 24),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 items per row
            mainAxisSpacing: 16, // Vertical spacing
            crossAxisSpacing: 5, // Horizontal spacing
            childAspectRatio: 0.8, // Adjust the ratio of width to height
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  switch (items[index].label.toLowerCase()) {
                    case "calendar":
                      {
                        Get.toNamed(RoutePath.calendar);
                      }
                    default:
                  }
                },
                child: _buildGridItem(items[index]));
          },
        ),
      ),
    );
  }

  Widget _buildGridItem(GridItem item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Image.asset(
              item.icon,
              height: 50,
              width: 50,
            )),
        const SizedBox(height: 8),
        FittedBox(
          child: CustomeText(
              text: item.label,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ],
    );
  }
}
