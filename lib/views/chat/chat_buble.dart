import 'dart:convert';

import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/views/chat/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBuble extends StatelessWidget {
  ChatBuble({super.key, required this.msg});
  final Message msg;
  final controller = Get.put(Datacontroller());
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Stack(
        children: [
          Container(
            constraints: BoxConstraints(minWidth: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  constraints: BoxConstraints(minWidth: 100),
                  margin: const EdgeInsets.fromLTRB(32, 8, 8, 8),
                  padding: const EdgeInsets.fromLTRB(32, 16, 16, 16),
                  decoration: const BoxDecoration(
                      color: Color(0xFF375FFF),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16))),
                  child: Container(
                    constraints: BoxConstraints(
                        minWidth: 50,
                        maxWidth: MediaQuery.sizeOf(context).width * 0.5),
                    child: Text(
                      msg.messageText,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: Constans.fontFamily),
                    ),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(999)),
                  child: msg.image == 'null'
                      ? Image.asset(
                          "assets/images/pers.png",
                          fit: BoxFit.cover,
                        )
                      : Image.memory(
                          base64Decode(msg.image),
                          fit: BoxFit.cover,
                        ),
                ),
              ],
            ),
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.topRight,
            child: Container(
                padding: EdgeInsets.only(right: 56),
                margin: EdgeInsets.all(8),
                child: Text(
                  msg.name,
                  style: TextStyle(
                      fontFamily: Constans.fontFamily,
                      fontSize: 12,
                      color: Colors.white),
                )),
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
      alignment: Alignment.centerRight,
      child: Stack(
        children: [
          Container(
            constraints: BoxConstraints(minWidth: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(999)),
                  child: msg.image == 'ammis'
                      ? Image.asset(
                          "assets/images/pers.png",
                          fit: BoxFit.cover,
                        )
                      : Image.memory(
                          base64Decode(msg.image),
                          fit: BoxFit.cover,
                        ),
                ),
                Container(
                  constraints: BoxConstraints(minWidth: 100),
                  margin: const EdgeInsets.fromLTRB(8, 8, 32, 8),
                  padding: const EdgeInsets.fromLTRB(16, 16, 32, 16),
                  decoration: const BoxDecoration(
                      color: Color(0xFF1B2B48),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16))),
                  child: Container(
                    constraints: BoxConstraints(
                        minWidth: 50,
                        maxWidth: MediaQuery.sizeOf(context).width * 0.5),
                    child: Text(
                      msg.messageText,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: Constans.fontFamily),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.topLeft,
            child: Container(
                padding: EdgeInsets.only(left: 56),
                margin: EdgeInsets.all(8),
                child: Text(
                  msg.name,
                  style: TextStyle(
                      fontFamily: Constans.fontFamily,
                      fontSize: 10,
                      color: Colors.white.withOpacity(.7)),
                )),
          ))
        ],
      ),
    );
  }
}
