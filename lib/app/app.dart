import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../route/route_service.dart';
import 'bottom_navbar.dart/controller/bottom_navbar_controller.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Syntex Sonata',
      getPages: RouteService.getPages,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
