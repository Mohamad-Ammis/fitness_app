import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
void listenToNotification() {
  FirebaseMessaging.onMessage.listen((event) {
    if (event.notification != null) {
      print(event.notification!.title);
      print('FAFKFJAJSIOSIOF\n');
      print(event.notification!.body);
      Get.snackbar(event.notification!.title!, event.notification!.body!);
    }
  });
}
// // void refereshToken(){
//   FirebaseMessaging.instance.onTokenRefresh.listen((event) { })
// }