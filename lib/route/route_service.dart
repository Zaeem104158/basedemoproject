import 'package:baseproj/app/home/binding/home_binding.dart';
import 'package:baseproj/app/notification/binding/notification_binding.dart';
import 'package:baseproj/app/setting/binding/setting_binding.dart';
import 'package:baseproj/app/splash/binding/splash_binding.dart';
import 'package:baseproj/app/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app/home/screen/home_screen.dart';
import '../app/notification/screen/notification_screen.dart';
import '../app/setting/screen/setting_screen.dart';
import 'route_path.dart';

class RouteService {
  static final List<GetPage> getPages = [
    GetPage(
        name: RoutePath.splash,
        page: () => const SplashScreen(),
        transition: Transition.noTransition,
        binding: SplashBinding()),
    GetPage(
        name: RoutePath.home,
        page: () => const HomeScreen(),
        transition: Transition.noTransition,
        binding: HomeBinding()),
    GetPage(
        name: RoutePath.notification,
        page: () => const NotificationScreen(),
        transition: Transition.noTransition,
        binding: NotificationBinding()),
    GetPage(
      name: RoutePath.setting,
      page: () => const SettingsScreen(),
      transition: Transition.noTransition,
      binding: SettingsBinding(),
    ),
    // GetPage(
    //   name: '/result',
    //   page: () => ResultScreen(),
    //   transition: Transition.noTransition,
    // ),
    // GetPage(
    //   name: '/dairy',
    //   page: () => DairyScreen(),
    //   transition: Transition.noTransition,
    // ),
    // GetPage(
    //   name: '/photo',
    //   page: () => PhotoScreen(),
    //   transition: Transition.noTransition,
    // ),
  ];
}
