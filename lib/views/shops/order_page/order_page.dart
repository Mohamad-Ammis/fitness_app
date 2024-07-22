import 'package:fitnessapp/views/shops/order_details_page/order_details_page.dart';
import 'package:fitnessapp/views/shops/order_page/widgets/custom_appbar.dart';
import 'package:fitnessapp/views/shops/order_page/widgets/order_card.dart';
import 'package:fitnessapp/views/shops/order_page/widgets/upper_clipper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: Stack(
        children: [
          const Column(
            children: [
              UpperClipper(),
            ],
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height / 3 - 100,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.of(context).size.height,
              // // height: 50,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.to(() => const OrderDetailsPage()),
                      child: const OrderCard(),
                    );
                  }),
            ),
          ),
          const CustomAppBar()
        ],
      ),
    );
  }
}
