import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/chat/message.dart';
import 'package:fitnessapp/helper/custom_toast_notification.dart';
import 'package:fitnessapp/main.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  var messagesList = <Message>[].obs;
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  @override
  void onInit() {
    super.onInit();
    getMessages();
  }

  void sendMessage({required String message, required String? email}) {
    if (userInfo!.getString('email') != null) {
      messages.add({
        "message": message,
        'createdAt': DateTime.now(),
        'id': userInfo!.getString('email').toString(),
        'name': userInfo!.getString('name')
      });
    } else {
      showErrorSnackBar('Error Hapened',
          "You dont have permission to char please login again");
    }
  }

  void getMessages() {
    messages.orderBy('createdAt').snapshots().listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(Message.fromjson(doc));
      }
    });
  }
}
