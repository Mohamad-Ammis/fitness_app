import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/notification_controller.dart';
import 'package:fitnessapp/views/workout_page/profile/widgets/notification_card.dart';
import 'package:fitnessapp/widgets/shimmer/shimmer_custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});
  final controller = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F4F6),
        title: Text(
          "Notifications",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontFamily: Constans.fontFamily),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: controller.getAllNotifications(),
          builder: (context, snapshot) {
            return GetBuilder<NotificationController>(builder: (controller) {
              return ListView.builder(
                  itemCount: controller.notificationLoading
                      ? 5
                      : controller.notificationsList.length,
                  itemBuilder: (context, index) {
                    return controller.notificationLoading
                        ? ShimmerContainer(
                            width: MediaQuery.sizeOf(context).width,
                            height: 100,
                            circularRadius: 20,
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                          )
                        : NotificationCard(
                            model: controller.notificationsList[index],
                          );
                  });
            });
          }),
    );
  }
}
