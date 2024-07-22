import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCheckBox extends StatelessWidget {
  CustomCheckBox(
      {super.key,
      required this.title,
      required this.value,
      required this.onChanged});
  bool? value;
  Function(bool?) onChanged;
  String? title;
  Color kPrimer = const Color.fromARGB(255, 38, 164, 170);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        title!,
        style: const TextStyle(
            color: Colors.black, fontSize: 17, fontFamily: Constans.fontFamily),
      ),
      value: value,
      onChanged: onChanged,
      activeColor: kPrimer,
    );
  }
}
