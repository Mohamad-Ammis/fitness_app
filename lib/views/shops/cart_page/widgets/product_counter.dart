import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:fitnessapp/models/shop/ads_model.dart';
import 'package:fitnessapp/models/shop/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CartProductCounter extends StatefulWidget {
  const CartProductCounter({
    super.key,
    required this.model,
  });
  final ProductModel model;

  @override
  State<CartProductCounter> createState() => _CartProductCounterState();
}

class _CartProductCounterState extends State<CartProductCounter> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(builder: (controller) {
      return Row(
        children: [
          Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.05),
                  borderRadius: BorderRadius.circular(6)),
              child: GestureDetector(
                onTap: () {
                  if (widget.model.count > 1) {
                    widget.model.count--;
                    setState(() {});
                    controller.CartSubTotal -=
                        (double.parse(widget.model.price));
                    controller.update();
                    debugPrint(
                        'controller.CartSubTotal: ${controller.CartSubTotal}');
                  }
                },
                child: const Icon(
                  Icons.remove,
                  color: Constans.shopColor,
                ),
              )),
          const SizedBox(
            width: 15,
          ),
          Text(
            widget.model.count.toString(),
            style: TextStyle(
                fontFamily: Constans.fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.05),
                  borderRadius: BorderRadius.circular(6)),
              child: GestureDetector(
                onTap: () {
                  setState(() {});
                  controller.CartSubTotal += (double.parse(widget.model.price));
                  widget.model.count++;
                  controller.update();

                  debugPrint(
                      'controller.CartSubTotal: ${controller.CartSubTotal}');
                },
                child: const Icon(
                  Icons.add,
                  color: Constans.shopColor,
                ),
              )),
        ],
      );
    });
  }
}
