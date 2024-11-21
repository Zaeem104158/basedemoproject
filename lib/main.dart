import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const App(),
  ));
}





/*class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppAndBottomBar(child: Center(child: Text('Result Screen')));
  }
}

class DairyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppAndBottomBar(child: Center(child: Text('Dairy Screen')));
  }
}

class PhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppAndBottomBar(child: Center(child: Text('Photo Screen')));
  }
} */
