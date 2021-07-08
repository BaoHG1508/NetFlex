// @dart = 2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflex/constants/Navigator.dart';
import 'package:netflex/screens/Auth/LoginScreen.dart';
import 'package:netflex/screens/Auth/RegisterScreen.dart';
import 'package:netflex/screens/CategoryScreen.dart';
import 'package:netflex/screens/DetailScreen.dart';
import 'package:netflex/screens/WatchScreen.dart';
import 'package:netflex/screens/account.dart';
import 'package:netflex/controller/AuthController.dart';
import 'package:netflex/controller/movie_controller.dart';
import 'package:netflex/controller/url_controller.dart';
import 'screens/Selecting_Screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Controller movieController = Get.put(Controller());
  final UrlController urlController = Get.put(UrlController());
  final AuthController authController = Get.put(AuthController());

  @override

  Widget build(BuildContext context) {
    return GetMaterialApp(
          initialRoute: SiteNavigation.LOGIN,
          routes: {
            SiteNavigation.HOME: (context) => Selecting_Screen(),
            SiteNavigation.DETAIL: (context) => DetailScreen(),
            SiteNavigation.LOGIN: (context) => LoginScreen(),
            SiteNavigation.REGISTER: (context) => SignUpScreen(),
            SiteNavigation.CATEGORY: (context) => CategoryScreen('phimle'),
            SiteNavigation.WATCH: (context) => WatchingScreen(),
            SiteNavigation.ACCOUNT: (context) => AccountScreen(),
          },
      );
  }
}
