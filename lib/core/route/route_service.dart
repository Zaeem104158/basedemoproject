import 'package:baseproj/app/bottom_navbar.dart/binding/bottom_navbar_binding.dart';
import 'package:baseproj/app/login/binding/login_binding.dart';
import 'package:baseproj/app/login/screen/login_screen.dart';
import 'package:get/get.dart';
import '../../app/bottom_drawer/binding/bottom_drawer_binding.dart';
import '../../app/calendar/binding/calendar_binding.dart';
import '../../app/calendar/screen/calendar_screen.dart';
import '../../app/fee_details/binding/fee_details_binding.dart';
import '../../app/fee_details/screen/fee_details_screen.dart';
import '../../app/home/binding/home_binding.dart';
import '../../app/home/screen/home_screen.dart';
import '../../app/notification/binding/notification_binding.dart';
import '../../app/notification/screen/notification_screen.dart';
import '../../app/bottom_drawer/screen/bottom_drawer_screen.dart';
import '../../app/onboarding/binding/onoarding_binding.dart';
import '../../app/onboarding/screen/onboarding_screen.dart';
import '../../app/splash/binding/splash_binding.dart';
import '../../app/splash/screen/splash_screen.dart';
import '../theme/binding/theme_binding.dart';
import 'route_path.dart';

class RouteService {
  static final List<GetPage> getPages = [
    GetPage(
        name: RoutePath.splash,
        page: () => const SplashScreen(),
        transition: Transition.noTransition,
        binding: SplashBinding()),
    GetPage(
        name: RoutePath.onboarding,
        page: () => const OnboardingScreen(),
        transition: Transition.noTransition,
        binding: OnboardingBinding()),
    GetPage(
        name: RoutePath.login,
        page: () => const LoginScreen(),
        transition: Transition.noTransition,
        binding: LoginBinding()),
    GetPage(
        name: RoutePath.home,
        page: () => const HomeScreen(),
        transition: Transition.noTransition,
        bindings: [ThemeBinding(), BottomNavbarBinding(), HomeBinding()]),
    GetPage(
        name: RoutePath.notification,
        page: () => const NotificationScreen(),
        transition: Transition.noTransition,
        bindings: [NotificationBinding(), BottomNavbarBinding()]),
    GetPage(
      name: RoutePath.bottomDrawer,
      page: () => const BottomDrawer(),
      transition: Transition.noTransition,
      bindings: [BottomDrawerBinding(), BottomNavbarBinding()],
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
  ];
}
