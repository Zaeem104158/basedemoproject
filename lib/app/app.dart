import 'package:baseproj/core/theme/binding/theme_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/route/route_service.dart';
import '../core/theme/dark_theme/dark_theme.dart';
import '../core/theme/light_theme/light_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      title: 'Syntex Sonata',
      initialBinding: ThemeBinding(),
      getPages: RouteService.getPages,
      theme: lightTheme, // Default light theme
      darkTheme: darkTheme, // Dark theme
      themeMode: ThemeMode.system,
    );
  }
}
