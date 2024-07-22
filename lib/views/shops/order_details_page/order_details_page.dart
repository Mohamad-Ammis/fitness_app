import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/shops/order_details_page/widgets/custom_time_line_tile.dart';
import 'package:fitnessapp/views/shops/order_details_page/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F4F6),
        centerTitle: true,
        title: const Text(
          "Order Status",
          style: TextStyle(
            fontFamily: Constans.fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            const Text(
              "Order#2139080",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: Constans.fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            Lottie.asset('assets/lottie/order_sending.json'),
            const CustomTimeLineTile(
              isFirst: true,
              isLast: false,
              isPast: true,
              eventCard: EventCard(
                  title: "Order Sending", subtitle: '9:30 Am , 9 May 2020'),
            ),
            const CustomTimeLineTile(
              isFirst: false,
              isLast: false,
              isPast: false,
              eventCard: null,
            ),
            const CustomTimeLineTile(
              isFirst: false,
              isLast: true,
              isPast: false,
              eventCard: null,
            ),
          ],
        ),
      ),
    );
  }
}
