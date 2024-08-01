import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:fitnessapp/views/auth_pages/widgets/auth_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BillInfoSection extends StatelessWidget {
  BillInfoSection({
    super.key,
  });
  final controller = Get.put(ShopController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.8),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sub Total : ",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: Constans.fontFamily,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                Text(
                  "\$${controller.cartSubTotal.toStringAsFixed(2)}",
                  style: const TextStyle(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Price : ",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: Constans.fontFamily,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                Text(
                  "\$${controller.cartSubTotal.toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontFamily: Constans.fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: controller.checkout
                  ? null
                  : () async {
                      controller.checkout = true;
                      controller.update();
                      var data = await controller.createOrder(null, context);
                      controller.checkout = false;
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
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Constans.shopColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: controller.checkout
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text("Check Out",
                            style: TextStyle(
                                fontFamily: Constans.fontFamily,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18))),
              ),
            )
          ],
        ),
      );
    });
  }
}

class CustomPaymentBottoomSheet extends StatelessWidget {
  CustomPaymentBottoomSheet(
      {super.key,
      required this.orderId,
      required this.totalPrice,
      required this.productCount});
  final String orderId;
  final String totalPrice;
  final String productCount;
  final controller = Get.put(ShopController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(builder: (controller) {
      return IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'complete payment steps to avoid lose your order',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: Constans.fontFamily),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Order Number : $orderId',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: Constans.fontFamily),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Products Count : $productCount',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: Constans.fontFamily),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Total price : $totalPrice',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: Constans.fontFamily),
              ),
              const SizedBox(
                height: 20,
              ),
              AuthCustomButton(
                  backgroundColor: Constans.shopColor,
                  titleColor: Colors.white,
                  width: MediaQuery.sizeOf(context).width,
                  buttonText: controller.checkout
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Pay',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: Constans.fontFamily),
                        ),
                  onTap: controller.checkout
                      ? null
                      : () async {
                          controller.checkout = true;
                          controller.update();

                          if (orderId != '') {
                            var url =
                                await controller.payOrder(orderId.toString());
                            if (url != '') {
                              var uri = Uri.parse(url.toString());
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri,
                                    mode: LaunchMode.externalApplication);
                              } else {
                                // can't launch url
                              }
                            }
                          }
                          controller.checkout = false;
                          debugPrint(Get.isBottomSheetOpen.toString());
                          controller.update();
                        })
            ],
          ),
        ),
      );
    });
  }
}
