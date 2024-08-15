import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/firebase_options.dart';
import 'package:fitnessapp/home.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/services/notification.dart';
import 'package:fitnessapp/views/auth_pages/login_page/login_page.dart';
import 'package:fitnessapp/views/on_boarding/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  FirebaseMessaging.instance.getToken().then(((value) {
    print(value);
    userInfo!.setString('fcm_token', value.toString());
  }));
  FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
    userInfo!.setString('fcm_token', fcmToken.toString());
  }).onError((err) {
    debugPrint('error on refresh token');
  });

  listenToNotification();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  debugPrint('token ${userInfo?.getString('token').toString()}');

  userInfo = await SharedPreferences.getInstance();
  debugPrint('userInfo: ${userInfo!.getString('token')}');
}

void handlePageTransition() {
  final controller = Get.put(Datacontroller(), permanent: true);

  Timer(const Duration(seconds: 3), () {
    if (userInfo!.getInt("man") != null) {
      controller.setmemoryman(userInfo!.getInt("man")!);
      if (userInfo!.getString("image") != null) {
        controller.setmemoryimage(userInfo!.getString("image")!);
      }
      // Get.offAll(OnBoarding());
      Get.offAll(LogInPage());
    } else {
      if (userInfo!.getBool('firstUse') == false) {
        Get.offAll(LogInPage());
      } else {
        Get.offAll(OnBoarding());
      }
    }
    //  Get.offAll(Media()) ;
  });
}
