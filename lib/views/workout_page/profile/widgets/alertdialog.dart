import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAlertDialog extends StatelessWidget {
  CustomAlertDialog({
    super.key,
    required this.action,
    required this.titleText,
    required this.content,
  });
  List<Widget>? action;
  String? titleText;
  Widget? content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: action,
      title: Text(
        titleText!,
        style: const TextStyle(fontFamily: Constans.fontFamily),
      ),
      content: content,
    );
  }
}
