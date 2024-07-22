import 'dart:async';
<<<<<<< HEAD
import 'package:fitnessapp/views/food/food.dart';
=======

import 'package:fitnessapp/views/shops/home_page/shop.dart';
>>>>>>> d266931d926bc5b2496f95c6f532ed3bb659c797

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
<<<<<<< HEAD

=======
>>>>>>> d266931d926bc5b2496f95c6f532ed3bb659c797
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = Get.put(Datacontroller(), permanent: true);
<<<<<<< HEAD

=======
>>>>>>> d266931d926bc5b2496f95c6f532ed3bb659c797
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
<<<<<<< HEAD
        Get.offAll(() => Home());
=======
        Get.offAll(() => Shop());
>>>>>>> d266931d926bc5b2496f95c6f532ed3bb659c797
      }
      // Get.offAll(Home()) ;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
<<<<<<< HEAD

        // initialRoute
=======
>>>>>>> d266931d926bc5b2496f95c6f532ed3bb659c797
        debugShowCheckedModeBanner: false,
        routes: {
          '/register': (p0) => const RegisterPage(),
          '/login': (p0) => const LogInPage()
        },
        // initialRoute: '/',
        home: const Splash());
  }
}
