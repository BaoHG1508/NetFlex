// @dart = 2.9

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflex/services/controller/movie_controller.dart';
import 'package:netflex/services/controller/url_controller.dart';
import 'screens/Selecting_Screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Controller movieController = Get.put(Controller());
  final UrlController urlController = Get.put(UrlController());

  @override

  Widget build(BuildContext context) {
    return GetMaterialApp(
          home: Selecting_Screen(),
      );
  }
}
