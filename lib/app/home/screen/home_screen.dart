import 'package:baseproj/app/home/controller/home_controller.dart';
import 'package:baseproj/core/color/app_colors.dart';
import 'package:baseproj/core/route/route_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_widget/custome_text.dart';
import '../../../common_widget/scaffold_appandbottomnavbar.dart';
import '../../../core/utility/image_path.dart';
import '../../drawer/custome_drawer.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppAndBottomBar(
        showDrawer: true,
        actions: [
          Obx(() => Switch(
                value: controller.themeController.isDarkMode,
                onChanged: (value) {
                  controller.themeController.toggleTheme();
                },
              ))
        ],
        //onBackRoute: controller.previousRoute.value,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomeText(
                    text: "Notice Board",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Row(
                    children: [
                      CustomeText(
                        text: "See All",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
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
                  List<Color> noticeDarkColors = <Color>[
                    const Color(0xFF2D6F59),
                    const Color(0xFF7F3C3C),
                    const Color(0xFF4C7A82)
                  ];
                  return Container(
                    margin: const EdgeInsets.only(right: 16),
                    padding: const EdgeInsets.all(12),
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Get.isDarkMode
                          ? noticeDarkColors[index % noticeColors.length]
                          : noticeColors[index % noticeColors.length],
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
                        CustomeText(
                          text: "School is going for vacation in next month",
                          style: Theme.of(context).textTheme.labelLarge,
                          maxLines: 2,
                        ),
                        CustomeText(
                          text: "02 March, 2024",
                          style: Theme.of(context).textTheme.labelSmall,
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
                      child: _buildGridItem(items[index], context),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildGridItem(GridItem item, context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            radius: 50,
            backgroundColor:
                Get.isDarkMode ? Colors.grey.shade600 : Colors.grey.shade200,
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
