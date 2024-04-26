import 'dart:async';
import 'package:fitnessapp/utils/app_images.dart';
import 'package:fitnessapp/views/auth_pages/login_page/login_page.dart';
import 'package:fitnessapp/views/auth_pages/register_page/register_page.dart';
import 'package:fitnessapp/views/on_boarding/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => Get.offAll(OnBoarding()));
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/register': (p0) => const RegisterPage(),
        '/login': (p0) => const LogInPage()
      },
      // initialRoute: '/',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.imagesSplash),
            ],
          ),
        ),
      ),
    );
  }
}
