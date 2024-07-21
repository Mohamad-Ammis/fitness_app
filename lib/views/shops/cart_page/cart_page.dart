import 'package:fitnessapp/views/shops/cart_page/widgets/bill_info_section.dart';
import 'package:fitnessapp/views/shops/cart_page/widgets/product_listview.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xFFF3F4F6),
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ProductListView(),
          ),
          const SizedBox(
            height: 10,
          ),
          const Expanded(child: BillInfoSection())
        ],
      ),
    );
  }
}
