import 'dart:async';
<<<<<<< HEAD
import 'package:fitnessapp/views/food/food.dart';

=======
import 'package:fitnessapp/views/on_boarding/on_boarding.dart';
>>>>>>> 8f5b8c838a2980b8dcbf717d6883e5bf3ca10d2f
import '../controller/datacont.dart';
import 'package:fitnessapp/home.dart';
import 'package:fitnessapp/splash_screen.dart';
import 'package:fitnessapp/views/auth_pages/login_page/login_page.dart';
import 'package:fitnessapp/views/auth_pages/register_page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// SharedPreferences? preference;
SharedPreferences? userInfo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  userInfo = await SharedPreferences.getInstance();
<<<<<<< HEAD
=======
  debugPrint(userInfo.toString());
>>>>>>> 8f5b8c838a2980b8dcbf717d6883e5bf3ca10d2f
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

>>>>>>> 8f5b8c838a2980b8dcbf717d6883e5bf3ca10d2f
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (userInfo!.getInt("man") != null) {
        controller.setmemoryman(userInfo!.getInt("man")!);
        if (userInfo!.getString("image") != null) {
          controller.setmemoryimage(userInfo!.getString("image")!);
        }
        Get.offAll(Home());
      } else {
<<<<<<< HEAD
        Get.offAll(() => Home());
=======
        Get.offAll(OnBoarding());
>>>>>>> 8f5b8c838a2980b8dcbf717d6883e5bf3ca10d2f
      }
      //  Get.offAll(Pre()) ;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
<<<<<<< HEAD
=======
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white, canvasColor: Colors.white),
>>>>>>> 8f5b8c838a2980b8dcbf717d6883e5bf3ca10d2f

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
