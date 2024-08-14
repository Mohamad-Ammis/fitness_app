import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFieldOutline extends StatelessWidget {
  CustomTextFieldOutline({
    super.key,
    required this.labelText,
    required this.onSaved,
    required this.validation,
    required this.textCon,
  });
  TextEditingController textCon;
  String? labelText;
  Function(dynamic)? onSaved;
  String? Function(String?) validation;
  GlobalKey<FormState>? formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: TextFormField(
        controller: textCon,
        onSaved: onSaved,
        validator: validation,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 17,
              fontFamily: Constans.fontFamily),
          contentPadding: const EdgeInsets.only(left: 15),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black87, width: 0.3),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black26),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTextFieldUnderline extends StatelessWidget {
  CustomTextFieldUnderline({
    super.key,
    required this.labelText,
    required this.onSaved,
    required this.validation,
    required this.icon,
    required this.iconColor,
    required this.con,
  });

  String? labelText;
  Function(dynamic)? onSaved;
  String? Function(String?) validation;
  IconData? icon;
  Color? iconColor;
  GlobalKey<FormState>? formKey = GlobalKey();
  TextEditingController con;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: TextFormField(
        controller: con,
        onSaved: onSaved,
        validator: validation,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: iconColor,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 17,
              fontFamily: Constans.fontFamily),
          contentPadding: const EdgeInsets.only(left: 15),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 0.3, color: Colors.black87)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 0.3, color: Colors.black87)),

          // enabledBorder: OutlineInputBorder(
          //     borderSide: const BorderSide(
          //       color: Colors.black,
          //     ),
          //     borderRadius: BorderRadius.circular(10)),
          // border: OutlineInputBorder(
          //     borderSide: const BorderSide(color: Colors.black),
          //     borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
