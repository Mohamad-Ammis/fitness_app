import 'dart:async';
import 'package:fitnessapp/views/food/food.dart';

import '../controller/datacont.dart';
import 'package:fitnessapp/home.dart';
import 'package:fitnessapp/splash_screen.dart';
import 'package:fitnessapp/views/auth_pages/login_page/login_page.dart';
import 'package:fitnessapp/views/auth_pages/register_page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? preference;
SharedPreferences? userInfo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preference = await SharedPreferences.getInstance();
  userInfo = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = Get.put(Datacontroller(), permanent: true);

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (preference!.getInt("man") != null) {
        controller.setmemoryman(preference!.getInt("man")!);
        if (preference!.getString("image") != null) {
          controller.setmemoryimage(preference!.getString("image")!);
        }
        Get.offAll(() => const Home());
      } else {
        Get.offAll(() => Home());
      }
      // Get.offAll(Home()) ;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

        // initialRoute
        debugShowCheckedModeBanner: false,
        routes: {
          '/register': (p0) => const RegisterPage(),
          '/login': (p0) => const LogInPage()
        },
        // initialRoute: '/',
        home: const Splash());
  }
}
