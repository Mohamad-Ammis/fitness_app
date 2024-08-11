import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  final _openai = OpenAI.instance.build(
    token: Constans.apikey ,
     baseOption:HttpSetup(receiveTimeout:Duration(seconds: 5) ),
     enableLog: true
      ) ;
  
  final ChatUser _currentUser = ChatUser(
    id: '1',
    firstName: 'User',
  );

  final ChatUser _gptUser = ChatUser(
    id: '2',
    firstName: 'Gpt',
    profileImage: 'https://img.etimg.com/thumb/msid-105809531,width-640,resizemode-4,imgsize-426276/a-leap-into-the-future.jpg',
  );

  List<ChatMessage> _messages = <ChatMessage>[];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gemini Chat")),
      resizeToAvoidBottomInset: true,
      body: buildUI(),
    );
  }
    Widget buildUI() {
    return DashChat(
      
      messageOptions:MessageOptions(
        currentUserContainerColor: const Color.fromARGB(255, 250, 113, 159)
      ) ,
      currentUser: _currentUser, onSend: (ChatMessage m){
      getchatmessage(m);
     }, messages: _messages);
  }
  
   Future<void> getchatmessage(ChatMessage m) async{
     try{
     setState(() {
       _messages.insert(0, m);
     });
     List<Messages> _messgaeshistory = _messages.reversed.map((m){
      if(m.user == _currentUser){
        return Messages(role: Role.user,content:m.text );
      }else{
         return Messages(role: Role.assistant,content:m.text );
      }
     }).toList();
     final request = ChatCompleteText(
      model: GptTurboChatModel(), messages: _messgaeshistory ,maxToken: 200);
     final response = await _openai.onChatCompletion(request: request);
     for(var element in response!.choices){
      if(element.message!=null){
        setState(() {
          _messages.insert(0,ChatMessage(user: _gptUser,
           createdAt: DateTime.now(),
           text: element.message!.content
           ),
            );
        });
      }
     }

     }catch(error){
      print("************************$error");
     }
    }



}