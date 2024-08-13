import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

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
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                leading: Icon(
                  Icons.notifications_active,
                  color: Constans.test,
                ),
                title: Text(
                  'title',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: Constans.fontFamily,
                      fontSize: 20),
                ),
                subtitle: Text(
                  'sub',
                  style: TextStyle(fontFamily: Constans.fontFamily),
                ),
              ),
            );
          }),
    );
  }
}
