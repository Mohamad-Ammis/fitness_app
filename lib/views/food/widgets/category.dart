import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainCategory extends StatelessWidget {
  MainCategory(
      {super.key,
      this.onTap,
      required this.text,
      this.icon,
      this.size,
      this.left,
      this.top});
  void Function()? onTap;
  String? text;
  IconData? icon;
  double? size;
  double? left;
  double? top;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 15),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Stack(children: [
              Container(
                height: 90,
                width: 70,
                decoration: const BoxDecoration(
                  // color: Color.fromARGB(255, 38, 164, 170),
                  color: Constans.foodblue,
                  // color: Color.fromARGB(255, 142, 161, 182),
                  // color: Color(0xff77928d),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                ),
              ),
              Positioned(
                top: top!,
                left: left!,
                child: Icon(
                  icon!,
                  size: size!,
                  color: const Color(0xffefefef),
                ),
              ),
            ]),
          ),
          Text(
            text!,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: Constans.fontFamily,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
