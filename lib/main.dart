import 'package:fitnessapp/views/auth_pages/login_page/login_page.dart';
import 'package:fitnessapp/views/auth_pages/register_page/register_page.dart';
import 'package:fitnessapp/views/on_boarding/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     debugShowCheckedModeBanner: false,
     routes: {
      '/':(p)=> OnBoarding(),
      '/register':(p0) => const RegisterPage(),
      '/login':(p0) => const LogInPage()
     },
     initialRoute: '/',
    );
  }
}
