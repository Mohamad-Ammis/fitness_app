import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/shop/order_model.dart';
import 'package:fitnessapp/views/shops/order_details_page/widgets/custom_time_line_tile.dart';
import 'package:fitnessapp/views/shops/order_details_page/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key, required this.model});
  final OrderModel model;
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Order#${model.id}",
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: Constans.fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              (model.status == 'pending' || model.status == "send")
                  ? Lottie.asset('assets/lottie/order_sending.json')
                  : model.status == "preparing"
                      ? Lottie.asset('assets/lottie/preparing.json')
                      : Lottie.asset('assets/lottie/order_received.json'),
              CustomTimeLineTile(
                isFirst: true,
                isLast: false,
                isPast: true,
                eventCard: EventCard(
                    title: "Order pending", subtitle: '${model.orderDate}'),
              ),
              CustomTimeLineTile(
                isFirst: false,
                isLast: false,
                isPast: (model.status != "pending") ? true : false,
                eventCard: model.status != "pending"
                    ? EventCard(
                        title: "Order preparing",
                        subtitle: '${model.orderDate}')
                    : null,
              ),
              CustomTimeLineTile(
                isFirst: false,
                isLast: false,
                isPast:
                    (model.status != "pending" && model.status != 'preparing')
                        ? true
                        : false,
                eventCard:
                    (model.status != "pending" && model.status != 'preparing')
                        ? EventCard(
                            title: "Order sent", subtitle: '${model.orderDate}')
                        : null,
              ),
              CustomTimeLineTile(
                isFirst: false,
                isLast: true,
                isPast: model.status == 'received' ? true : false,
                eventCard:
                    (model.status != "pending" && model.status != 'preparing')
                        ? EventCard(
                            title: "Order received",
                            subtitle: '${model.orderDate}')
                        : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
