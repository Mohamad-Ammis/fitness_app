import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

class AuthCustomButton extends StatelessWidget {
  const AuthCustomButton({
    super.key, required this.buttonText, required this.onTap, this.width, this.borderRadius, this.backgroundColor, this.titleColor,  
  });
  final String buttonText;
  final void  Function()? onTap;
  final double? width;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        width:width?? MediaQuery.sizeOf(context).width - 100,
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius??32)),
            color:backgroundColor?? Constans.secondryColor),
        child:  Center(
            child: Text(
          buttonText,
          style:   TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: titleColor??Colors.black),
        )),
      ),
    );
  }
}
