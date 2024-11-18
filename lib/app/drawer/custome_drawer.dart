import 'package:baseproj/core/color/app_colors.dart';
import 'package:baseproj/core/utility/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widget/custome_text.dart';

class CustomeDrawerWidget extends StatelessWidget {
  const CustomeDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: AppColors.primaryColor,
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                      ),
                      title: CustomeText(
                        text: "Mustafiz",
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      subtitle: CustomeText(
                        text: "Class 1",
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 44,
                    ),
                    onPressed: () {
                      Get.back(); // Close the drawer
                    },
                  ),
                ],
              ),
            ),
            // const Divider(color: Colors.white54, thickness: 1),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(left: 16.0, right: 16, top: 24),
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 items per row
                  mainAxisSpacing: 16, // Vertical spacing
                  crossAxisSpacing: 16, // Horizontal spacing
                  childAspectRatio: 0.8, // Adjust the ratio of width to height
                ),
                itemBuilder: (context, index) {
                  return _buildGridItem(items[index]);
                },
              ),
            ),
          ],
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
        CustomeText(
            text: item.label,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ],
    );
  }
}

class GridItem {
  final String icon;
  final String label;

  GridItem({required this.icon, required this.label});
}

final List<GridItem> items = [
  GridItem(icon: ImagePath.home, label: "Dashboard"),
  GridItem(icon: ImagePath.homework, label: "Homework"),
  GridItem(icon: ImagePath.attendance, label: "Attendance"),
  GridItem(icon: ImagePath.feeDetails, label: "Fee Details"),
  GridItem(icon: ImagePath.exam, label: "Exam"),
  GridItem(icon: ImagePath.reportCard, label: "Report Card"),
  GridItem(icon: ImagePath.calender, label: "Calendar"),
  GridItem(icon: ImagePath.noticeboard, label: "Notice Board"),
  GridItem(icon: ImagePath.academicYear, label: "Academic Year"),
];
