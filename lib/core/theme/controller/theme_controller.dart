import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../dark_theme/dark_theme.dart';
import '../light_theme/light_theme.dart';

class ThemeController extends GetxController {
  final _storage = GetStorage();
  final _isDarkMode = false.obs;

  @override
  void onInit() {
    _isDarkMode.value = _storage.read('isDarkMode') ?? false;
    Get.changeTheme(_isDarkMode.value ? darkTheme : lightTheme);
    super.onInit();
  }

  bool get isDarkMode => _isDarkMode.value;

  void toggleTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    _storage.write('isDarkMode', _isDarkMode.value);
    Get.changeTheme(_isDarkMode.value ? darkTheme : lightTheme);
  }
  //   void _applyTheme() {
  //   Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  // }
}
