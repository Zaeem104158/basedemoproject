import 'dart:developer';
import 'package:baseproj/app/home/controller/home_controller.dart';
import 'package:baseproj/core/color/app_colors.dart';
import 'package:baseproj/route/route_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_widget/custome_text.dart';
import '../../../common_widget/scaffold_appandbottomnavbar.dart';
import '../../../core/utility/image_path.dart';
import '../../bottom_navbar.dart/controller/bottom_navbar_controller.dart';
import '../../drawer/custome_drawer.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppAndBottomBar(
        showDrawer: true,
        //onBackRoute: controller.previousRoute.value,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomeText(
                    text: "Notice Board",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                  Row(
                    children: [
                      CustomeText(
                        text: "See All",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  List<Color> noticeColors = <Color>[
                    const Color(0xFFd4ffea),
                    const Color(0xFFffd4d4),
                    const Color(0xFFd4f5ff)
                  ];
                  return Container(
                    margin: const EdgeInsets.only(right: 16),
                    padding: const EdgeInsets.all(12),
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: noticeColors[index % noticeColors.length],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(20), // Image radius
                            child: Image.asset(ImagePath.academicYear,
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const CustomeText(
                          text: "School is going for vacation in next month",
                          fontWeight: FontWeight.w400,
                          maxLines: 2,
                        ),
                        const CustomeText(
                          text: "02 March, 2024",
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                  );
                },
                itemCount: 6,
              ),
            ),
            Expanded(
              // flex: 2,
              child: SlideTransition(
                position: controller.animation,
                child: GridView.builder(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16, top: 24),
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // 3 items per row
                    mainAxisSpacing: 16, // Vertical spacing
                    crossAxisSpacing: 5, // Horizontal spacing
                    childAspectRatio:
                        0.8, // Adjust the ratio of width to height
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          switch (items[index].label.toLowerCase()) {
                            case "calendar":
                              {
                                Get.toNamed(RoutePath.calendar);
                              }
                            case 'fee details':
                              {
                                Get.toNamed(RoutePath.feeDetails);
                              }
                            default:
                          }
                        },
                        child: _buildGridItem(items[index]));
                  },
                ),
              ),
            ),
          ],
        ));
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
