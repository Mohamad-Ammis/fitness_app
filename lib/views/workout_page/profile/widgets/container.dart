import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  CustomContainer({super.key, required this.text, this.widget, this.icon});
  String? text;
  Widget? widget;
  IconData? icon;
  Color kPrimer = const Color.fromARGB(255, 38, 164, 170);
  Color bPrimer = const Color(0xfff3f4f6);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return widget!;
            });
      },
      overlayColor: WidgetStatePropertyAll(
        kPrimer.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          padding: const EdgeInsets.only(left: 15, top: 15),
          height: 55,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    icon,
                    color: kPrimer,
                  ),
                ),
                Text(
                  text!,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black.withAlpha(120),
                      fontSize: 18,
                      fontFamily: Constans.fontFamily),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
