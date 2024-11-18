import 'package:baseproj/app/home/controller/home_controller.dart';
import 'package:baseproj/core/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../common_widget/custome_text.dart';
import '../../../common_widget/scaffold_appandbottomnavbar.dart';
import '../../../core/utility/image_path.dart';
import '../../drawer/custome_drawer.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBottomBar(
        showDrawer: true,
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
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  List<Color> noticeColors = <Color>[
                    Color(0xFFd4ffea),
                    Color(0xFFffd4d4),
                    Color(0xFFd4f5ff)
                  ];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    height: 150,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: noticeColors[index % noticeColors.length],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 2, 8, 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(20), // Image border
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(35), // Image radius
                              child: Image.asset(ImagePath.academicYear,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          CustomeText(
                            text: "School is going for vacation in next month",
                            fontWeight: FontWeight.w400,
                          ),
                          CustomeText(
                            text: "02 March, 2024",
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 6,
              ),
            ),
            Expanded(
              flex: 2,
              child: SlideTransition(
                position: controller.animation,
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
        CustomeText(
            text: item.label,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ],
    );
  }
}
