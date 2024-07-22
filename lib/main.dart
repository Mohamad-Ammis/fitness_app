import 'dart:async';
<<<<<<< HEAD
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

<<<<<<< HEAD
// SharedPreferences? preference;
 SharedPreferences? userInfo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   userInfo=await SharedPreferences.getInstance();
=======
SharedPreferences? preference;
SharedPreferences? userInfo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preference = await SharedPreferences.getInstance();
  userInfo = await SharedPreferences.getInstance();
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
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
<<<<<<< HEAD
      if(userInfo!.getInt("man")!= null){
        controller.setmemoryman(userInfo!.getInt("man")!);
        if(userInfo!.getString("image")!= null){controller.setmemoryimage(userInfo!.getString("image")!);}
        Get.offAll(Home());
      }
     else{
      Get.offAll(OnBoarding()) ;
     }
    //  Get.offAll(Pre()) ;
    } );
=======
      if (preference!.getInt("man") != null) {
        controller.setmemoryman(preference!.getInt("man")!);
        if (preference!.getString("image") != null) {
          controller.setmemoryimage(preference!.getString("image")!);
        }
        Get.offAll(() => const Home());
      } else {
        Get.offAll(() => Shop());
      }
      // Get.offAll(Home()) ;
    });
>>>>>>> d266931d926bc5b2496f95c6f532ed3bb659c797
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
        home: const Splash());
  }
}
