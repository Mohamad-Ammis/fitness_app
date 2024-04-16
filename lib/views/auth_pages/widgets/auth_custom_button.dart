import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

class AuthCustomButton extends StatelessWidget {
  const AuthCustomButton({
    super.key, required this.buttonText, required this.onTap,
  });
  final String buttonText;
  final void  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.sizeOf(context).width - 100,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            color: Constans.secondryColor),
        child:  Center(
            child: Text(
          buttonText,
          style:  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
