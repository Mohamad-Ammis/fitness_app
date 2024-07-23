import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<ShopController>(
          init: ShopController(),
          builder: (controller) {
            return Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GNav(
                  gap: 8,
                  backgroundColor: Colors.black,
                  color: Colors.white,
                  activeColor: Colors.white,
                  tabBackgroundColor: Constans.shopColor.withOpacity(.7),
                  padding: const EdgeInsets.all(16),
                  tabMargin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  onTabChange: (value) {},
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      text: "Home",
                    ),
                    const GButton(
                      icon: Icons.favorite_border,
                      text: "Favorite",
                    ),
                    const GButton(
                      icon: FontAwesomeIcons.boxOpen,
                      text: "Order",
                    ),
                    const GButton(
                      icon: Icons.person,
                      text: "Profile",
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
