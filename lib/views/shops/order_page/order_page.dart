import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:fitnessapp/models/shop/order_model.dart';
import 'package:fitnessapp/views/shops/order_details_page/order_details_page.dart';
import 'package:fitnessapp/views/shops/order_page/widgets/custom_appbar.dart';
import 'package:fitnessapp/views/shops/order_page/widgets/order_card.dart';
import 'package:fitnessapp/views/shops/order_page/widgets/upper_clipper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OrderPage extends StatelessWidget {
  OrderPage({super.key});
  final controller = Get.put(ShopController());
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
              child: FutureBuilder(
                  future: controller.getAllOrders(),
                  builder: (context, snapshot) {
                    debugPrint('snapshot: ${snapshot.data}');
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => Get.to(() => OrderDetailsPage(
                                  model: OrderModel.fromJson(
                                      snapshot.data[index]))),
                              child: OrderCard(
                                model:
                                    OrderModel.fromJson(snapshot.data[index]),
                              ),
                            );
                          });
                    } else {
                      return Column(
                        children: [
                          Lottie.asset('assets/lottie/emptyorder.json'),
                          Text(
                            "You dont have any order yet\n let's create one",
                            style: TextStyle(fontFamily: Constans.fontFamily),
                          )
                        ],
                      );
                    }
                  }),
            ),
          ),
          const CustomAppBar()
        ],
      ),
    );
  }
}
