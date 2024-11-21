import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../core/utility/image_path.dart';

class CustomClipperAppBar extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final path = Path();
    var x = size.width;
    var y = size.height - 20;
    path.lineTo(0, y - 40);
    path.quadraticBezierTo(0, y, 40, y);
    path.lineTo(x - 20, y); // Bottom edge
    path.quadraticBezierTo(x, y, x, y + 20);
    path.lineTo(x, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool onBack;
  final String? onBackRoute;
  final Color backgroundColor;
  final List<Widget>? actions;
  const CustomAppBar(
      {super.key,
      required this.title,
      this.onBackRoute,
      this.onBack = false,
      required this.backgroundColor,
      this.actions});
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClipperAppBar(),
      child: AppBar(
        automaticallyImplyLeading: false,
        // title: Text(title),
        // backgroundColor: backgroundColor,
        actions: actions,
        flexibleSpace: Stack(
          children: [
            // Gradient Background
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF473f97),
              ),
              // child: SvgPicture.asset(ImagePath.imagePath),
            ),
            Align(
              alignment: Alignment.center, // Center the SVG logo
              child: SvgPicture.asset(
                ImagePath.appbarLogo,
                height: 90,
                color: Colors.grey.shade50.withOpacity(0.1),
              ),
            ),
            // Drawer Icon and Title at Bottom
            Align(
              alignment: Alignment.center, // Position at bottom-left
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, bottom: 0.0), // Add padding for placement
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Drawer Icon
                    Builder(
                      builder: (context) => IconButton(
                        icon: Icon(
                            !onBack
                                ? Icons.grid_view_rounded
                                : Icons.arrow_back_ios_new,
                            color: Colors.white),
                        onPressed: () => !onBack
                            ? Scaffold.of(context).openDrawer()
                            : Get.back(),
                      ),
                    ),
                    // Title
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: CircleAvatar(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
