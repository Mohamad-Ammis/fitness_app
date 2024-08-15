
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.model,
  });
  final NotificationModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              model.date,
              style: TextStyle(fontFamily: Constans.fontFamily, fontSize: 12),
            ),
          ],
        ),
        leading: Icon(
          Icons.notifications_active,
          color: Constans.test,
        ),
        title: Text(
          model.title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: Constans.fontFamily,
              fontSize: 20),
        ),
        subtitle: Text(
          model.body,
          style: TextStyle(fontFamily: Constans.fontFamily),
        ),
      ),
    );
  }
}
