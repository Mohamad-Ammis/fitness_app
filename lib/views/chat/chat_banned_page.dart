import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/chat/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ChatBannedPage extends StatelessWidget {
  ChatBannedPage({super.key});
  final controller = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
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
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/block.json'),
          Center(
            child: Text(
              'You cant use chat because you have been blocked\nremaining time ${controller.getRemainingBlockTime()} ',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: Constans.fontFamily,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
