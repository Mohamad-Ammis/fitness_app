import 'package:flutter/material.dart';

class AppbarIcon extends StatelessWidget {
  const AppbarIcon({
    super.key,
    required this.icon,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(8)),
      child: Icon(icon, color: Colors.black),
    );
  }
}
