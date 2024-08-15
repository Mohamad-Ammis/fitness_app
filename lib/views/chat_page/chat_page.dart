
import 'package:fitnessapp/views/chat_page/chat_buble.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final ScrollController _controllerList = ScrollController();
  static String id = 'ChatPage';

  @override
  Widget build(BuildContext context) {
    // String email = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/apps.png',
                height: 50,
              ),
              const Text("Chat"),
            ],
          ),
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            Expanded(
              child: 
                  ListView.builder(
                      controller: _controllerList,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return 
                            ChatBuble(msg: 'hello',
                                
                              );
                      })
                
              
            ),
            Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: controller,
                  onSubmitted: (data) {
                    // BlocProvider.of<ChatCubit>(context).sendMessage(message: data,email: email);
                    controller.clear();
                    _controllerList.animateTo(
                      _controllerList.position.maxScrollExtent,
                      duration: Duration(microseconds:500 ),
                      curve: Curves.fastOutSlowIn,
                    );
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 12),
                    hintText: "Send Message",
                    suffixIcon: const Icon(
                      Icons.send,
                      color:Colors.red,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ))
          ],
        ));
  }
}
