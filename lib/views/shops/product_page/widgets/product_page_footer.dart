import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:fitnessapp/helper/custom_toast_notification.dart';
import 'package:fitnessapp/models/shop/product_model.dart';
import 'package:fitnessapp/views/shops/cart_page/widgets/bill_info_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPageFooter extends StatelessWidget {
  ProductPageFooter({
    super.key,
    required this.model,
  });
  final controller = Get.put(ShopController(), permanent: true);
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            debugPrint(model.colors.toString());
            if (!controller.cartProducts.contains(model)) {
              debugPrint('askdhkjsgdadsash');
              controller.orderCartProducs
                  .add({'product_id': model.id, "quantity": '1'});
              controller.cartProducts.add(model);
              showSuccesSnackBar('Added Successfully', 'product added to cart')
                .show(context);
            } else {
              debugPrint('Already exists');
              showErrorSnackBar(
                  'Error happened', ' product is Alreday exists in your cart')
                .show(context);
            }
            // controller.cartProducts.indexOf(widget.model) == -1

            debugPrint(
                'controller.orderCartProducs: ${controller.orderCartProducs}');
          },
          child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(999)),
              child: const Center(
                  child: Icon(
                Icons.add,
                color: Colors.black,
                size: 32,
              ))),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: GetBuilder<ShopController>(builder: (controller) {
            return GestureDetector(
              onTap: () async {
                controller.buyNow = true;
                controller.update();
                var data = await controller.createOrder([
                  {'product_id': model.id, 'quantity': "1"}
                ], context);
                controller.buyNow = false;
                controller.update();
                if (data != '') {
                  var orderId = data['id'].toString();
                  var productCount = data['product_count'].toString();
                  var totalPrice = data['total'].toString();
                  Get.bottomSheet(CustomPaymentBottoomSheet(
                      orderId: orderId,
                      totalPrice: totalPrice,
                      productCount: productCount));
                }
              },
              child: Container(
                  width: 200,
                  height: 60,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: controller.buyNow
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            "Buy now",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: Constans.fontFamily,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                  )),
            );
          }),
        ),
      ],
    );
  }
}
