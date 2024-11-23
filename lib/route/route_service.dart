import 'package:baseproj/app/fee_details/screen/fee_details_screen.dart';
import 'package:baseproj/app/home/binding/home_binding.dart';
import 'package:baseproj/app/notification/binding/notification_binding.dart';
import 'package:baseproj/app/bottom_drawer/binding/bottom_drawer_binding.dart';
import 'package:baseproj/app/splash/binding/splash_binding.dart';
import 'package:baseproj/app/splash/screen/splash_screen.dart';
import 'package:get/get.dart';
import '../app/calendar/binding/calendar_binding.dart';
import '../app/calendar/screen/calendar_screen.dart';
import '../app/fee_details/binding/fee_details_binding.dart';
import '../app/home/screen/home_screen.dart';
import '../app/notification/screen/notification_screen.dart';
import '../app/bottom_drawer/screen/bottom_drawer_screen.dart';
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
      page: () => const BottomDrawer(),
      transition: Transition.noTransition,
      binding: BottomDrawerBinding(),
    ),
    GetPage(
      name: RoutePath.calendar,
      page: () => const CalendarScreen(),
      binding: CalendarBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RoutePath.feeDetails,
      page: () => const FeeDetailsScreen(),
      binding: FeeDetailsBinding(),
      transition: Transition.noTransition,
    ),
    // GetPage(
    //   name: '/photo',
    //   page: () => PhotoScreen(),
    //   transition: Transition.noTransition,
    // ),
  ];
}
