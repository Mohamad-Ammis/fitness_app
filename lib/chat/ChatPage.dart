import 'package:fitnessapp/chat/ChatBuble.dart';
import 'package:fitnessapp/chat/chat_controller.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final ScrollController _controllerList = ScrollController();
  static String id = '/ChatPage';

  @override
  Widget build(BuildContext context) {
    final chatController = Get.put(ChatController());
    String? email = userInfo!.getString('email');

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesAbsIcon2,
              height: 50,
            ),
            const Text("Chat"),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                controller: _controllerList,
                itemCount: chatController.messagesList.length,
                itemBuilder: (context, index) {
                  debugPrint(chatController.messagesList[index].id.toString());
                  debugPrint(email.toString());
                  return chatController.messagesList[index].id == email
                      ? ChatBuble(msg: chatController.messagesList[index])
                      : ChatBubleFromFriend(
                          msg: chatController.messagesList[index]);
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                chatController.sendMessage(message: data, email: email);
                controller.clear();
                _controllerList.animateTo(
                  _controllerList.position.maxScrollExtent,
                  duration: Duration(microseconds: 500),
                  curve: Curves.fastOutSlowIn,
                );
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                hintText: "Send Message",
                suffixIcon: const Icon(Icons.send, color: Colors.red),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
