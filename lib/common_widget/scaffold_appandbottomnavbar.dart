import 'package:flutter/material.dart';
import '../app/appbar/custome_appbar.dart';
import '../app/bottom_navbar.dart/widget/bottom_navbar_widget.dart';
import '../app/drawer/custome_drawer.dart';

class ScaffoldWithAppAndBottomBar extends StatelessWidget {
  final Widget child;
  final String appbarTitle;
  final bool showDrawer;
  final String? onBackRoute;

  const ScaffoldWithAppAndBottomBar(
      {super.key,
      required this.child,
      this.appbarTitle = "Home",
      this.showDrawer = false,
      this.onBackRoute});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBack: !showDrawer,
        onBackRoute: onBackRoute,
        title: appbarTitle,
        backgroundColor: Colors.transparent,
      ),
      drawer: showDrawer ? const CustomeDrawerWidget() : null,
      body: child,
      bottomNavigationBar: const BottomNavBar(), // Global BottomBar
    );
  }
}
