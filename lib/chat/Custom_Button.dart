import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {this.ontap, super.key, required this.text, this.marginBottomValue});
  String text;
  VoidCallback? ontap;
  double? marginBottomValue;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(
          bottom: marginBottomValue ?? 0,
        ),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 24),
        )),
      ),
    );
  }
}
