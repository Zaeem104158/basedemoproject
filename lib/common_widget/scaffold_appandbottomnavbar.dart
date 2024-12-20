import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app/appbar/custome_appbar.dart';
import '../app/bottom_navbar.dart/widget/bottom_navbar_widget.dart';
import '../app/drawer/custome_drawer.dart';
import '../core/route/route_path.dart';

class ScaffoldWithAppAndBottomBar extends StatelessWidget {
  final Widget child;
  final String appbarTitle;
  final bool showDrawer;
  final Widget? floatingActionButton;
  final int? bottombarIndex;
  final List<Widget>? actions;

  const ScaffoldWithAppAndBottomBar({
    super.key,
    required this.child,
    this.appbarTitle = "Home",
    this.showDrawer = false,
    this.bottombarIndex = 0,
    this.floatingActionButton,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        } else {
          if (Get.currentRoute == RoutePath.home ||
              Get.currentRoute == RoutePath.notification ||
              Get.currentRoute == RoutePath.bottomDrawer) {
            // Show exit dialog only if on the home screen
            await _showExitDialog(context);
          } else {
            Get.back();
          }
        }
      },
      child: Scaffold(
        floatingActionButton: floatingActionButton,
        appBar: CustomAppBar(
          actions: actions,
          onBack: !showDrawer,
          title: appbarTitle,
          backgroundColor: Colors.transparent,
        ),
        drawer: showDrawer ? const CustomeDrawerWidget() : null,
        body: child,
        bottomNavigationBar: BottomNavBar(index: bottombarIndex),
      ),
    );
  }
}

Future<bool?> _showExitDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Exit App"),
      content: const Text("Are you sure you want to exit the app?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text("Exit"),
        ),
      ],
    ),
  );
}
