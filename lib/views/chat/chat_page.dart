import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/home.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/views/chat/chat_buble.dart';
import 'package:fitnessapp/views/chat/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  static String id = '/ChatPage';

  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController controller = TextEditingController();
  late GlobalKey<FormState> formKey;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final ScrollController _controllerList = ScrollController();
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    final chatController = Get.put(ChatController());
    final con = Get.put(Datacontroller());
    String? email = userInfo!.getString('email');
    var message = '';
    return Scaffold(
      backgroundColor: const Color(0xFF152033),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => ZoomDrawer.of(context)!.toggle(),
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            )),
        centerTitle: true,
        title: Text(
          'Training Hack\'s Community',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Color(0xFF0F1828),
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
          Form(
            autovalidateMode: autoValidateMode,
            key: formKey,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              color: const Color(0xFF0F1828),
              child: TextFormField(
                onChanged: (value) {
                  message = value;
                  debugPrint('message: $message');
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
                controller: controller,
                onFieldSubmitted: (data) async {
                  handleMessageStatus(chatController, data, con, email);
                },
                style: TextStyle(color: Color(0xFFADB5BD)),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  // contentPadding:
                  // const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                  hintText: "Send Message",
                  hintStyle: TextStyle(height: 1, color: Color(0xFFADB5BD)),
                  filled: true,

                  fillColor: const Color(0xFF152033),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      handleMessageStatus(chatController, message, con, email);
                    },
                    child: const Icon(
                      FontAwesomeIcons.solidPaperPlane,
                      color: Color(0xFFADB5BD),
                      size: 20,
                    ),
                  ),
                  focusColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleMessageStatus(ChatController chatController, String data,
      Datacontroller con, String? email) {
    if (formKey.currentState!.validate()) {
      if (chatController.offesiveWords.contains(data)) {
        debugPrint('bad word');
        userInfo!.setBool('isBanned', true);
        chatController.blockUser();
        Get.offAll(() => Home());
        showDialog(
            context: context,
            builder: (ctxx) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  title: const Text(
                    'Bad Behavior',
                    style: TextStyle(
                        color: Color.fromARGB(255, 252, 93, 93), fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  content: Text(
                      "You have been banned from using Training Hacks Community"),
                ));
      } else {
        debugPrint('image : ${con.base64String}');
        debugPrint('vaidate');
        debugPrint('');
        chatController.sendMessage(message: data, email: email);
        controller.clear();
        _controllerList.animateTo(
          _controllerList.position.maxScrollExtent,
          duration: Duration(microseconds: 500),
          curve: Curves.fastOutSlowIn,
        );
      }
    } else {
      debugPrint('vaidate no');
      autoValidateMode = AutovalidateMode.always;
    }
  }
}
