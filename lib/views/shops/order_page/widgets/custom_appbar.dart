import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 50,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              const Expanded(flex: 2, child: SizedBox()),
              const Text(
                'Orders',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: Constans.fontFamily,
                    fontWeight: FontWeight.bold),
              ),
              const Expanded(flex: 3, child: SizedBox())
            ],
          ),
        ));
  }
}
