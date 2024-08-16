import 'package:fitnessapp/chat/message.dart';
import 'package:fitnessapp/main.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key, required this.msg});
  final Message msg;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.only(
              top: 28,
              left: 16,
              bottom: 28,
              right: 28,
            ),
            decoration: const BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(999),
                    topRight: Radius.circular(999),
                    bottomLeft: Radius.circular(999))),
            child: Text(
              msg.messageText,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(margin: EdgeInsets.all(12), child: Text(msg.name)),
          ))
        ],
      ),
    );
  }
}

class ChatBubleFromFriend extends StatelessWidget {
  const ChatBubleFromFriend({super.key, required this.msg});
  final Message msg;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.only(
              top: 28,
              left: 28,
              bottom: 28,
              right: 16,
            ),
            decoration: const BoxDecoration(
                color: Color(0xff006D84),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(999),
                    topRight: Radius.circular(999),
                    bottomRight: Radius.circular(999))),
            child: Text(
              msg.messageText,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(margin: EdgeInsets.all(12), child: Text(msg.name)),
          ))
        ],
      ),
    );
  }
}
