
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/shops/order_page/widgets/my_custom_clipper.dart';
import 'package:flutter/material.dart';

class UpperClipper extends StatelessWidget {
  const UpperClipper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipPath(
        clipper: MyCustomClipper(),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 179, 196, 255),
            Constans.shopColor
          ])),
          child: Image.asset(
            'assets/images/card_background.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
