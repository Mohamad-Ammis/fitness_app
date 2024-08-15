import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key, required this.msg});
  final String msg;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.only(
          top: 28,
          left: 16,
          bottom: 28,
          right: 28,
        ),
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(999),
                topRight: Radius.circular(999),
                bottomRight: Radius.circular(999))),
        child: Text(
          msg,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}