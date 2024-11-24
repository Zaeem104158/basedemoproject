import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/storage_service/app_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStorage.init(); // Initialize GetStorage
  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => const App(),
  // ));
  runApp(
    const App(),
  );
}
