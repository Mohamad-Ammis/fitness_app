

import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

class BillInfoSection extends StatelessWidget {
  const BillInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
                width: double.infinity,
                decoration: BoxDecoration(
      color: Colors.white.withOpacity(.8),
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40))),
                child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Sub Total : ",
            style: TextStyle(
                color: Colors.black,
                fontFamily: Constans.fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          Text(
            "\$1251",
            style: TextStyle(
                fontFamily: Constans.fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Shipping : ",
            style: TextStyle(
                color: Colors.black,
                fontFamily: Constans.fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          Text(
            "Free",
            style: TextStyle(
                fontFamily: Constans.fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ],
      ),
      const SizedBox(
        height: 8,
      ),
      const Divider(
        thickness: 0.3,
      ),
      const SizedBox(
        height: 8,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total Price : ",
            style: TextStyle(
                color: Colors.black,
                fontFamily: Constans.fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          Text(
            "\$1251",
            style: TextStyle(
                fontFamily: Constans.fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ],
      ),
      const Expanded(child: SizedBox()),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Constans.shopColor,borderRadius: BorderRadius.circular(12)),
        child: const Center(child: Text("Check Out",style: TextStyle(
                fontFamily: Constans.fontFamily,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18))),
      )
    ],
                ),
              );
  }
}

