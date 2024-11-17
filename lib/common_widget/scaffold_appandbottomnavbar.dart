import 'package:flutter/material.dart';

import '../app/bottom_navbar.dart/widget/bottom_navbar_widget.dart';

class ScaffoldWithBottomBar extends StatelessWidget {
  final Widget child;
  final bool showDrawer;

  const ScaffoldWithBottomBar(
      {super.key, required this.child, this.showDrawer = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("App")),
      drawer: showDrawer
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      'Drawer Header',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  ListTile(
                    title: const Text('Item 1'),
                    onTap: () {
                      // Handle item 1 click
                    },
                  ),
                  ListTile(
                    title: const Text('Item 2'),
                    onTap: () {
                      // Handle item 2 click
                    },
                  ),
                ],
              ),
            )
          : null,
      body: child,
      bottomNavigationBar: const BottomNavBar(), // Global BottomBar
    );
  }
}
