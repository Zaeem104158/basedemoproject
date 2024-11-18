import 'package:flutter/material.dart';
import '../app/appbar/custome_appbar.dart';
import '../app/bottom_navbar.dart/widget/bottom_navbar_widget.dart';
import '../app/drawer/custome_drawer.dart';

class ScaffoldWithBottomBar extends StatelessWidget {
  final Widget child;
  final String appbarTitle;
  final bool showDrawer;

  const ScaffoldWithBottomBar(
      {super.key,
      required this.child,
      this.appbarTitle = "Home",
      this.showDrawer = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: appbarTitle,
        backgroundColor: Colors.transparent,
      ),
      drawer: showDrawer ? const CustomeDrawerWidget() : null,
      body: child,
      bottomNavigationBar: const BottomNavBar(), // Global BottomBar
    );
  }
}


