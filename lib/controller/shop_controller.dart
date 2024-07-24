import 'package:fitnessapp/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopController extends GetxController {
  final images = const [
    Assets.imagesShop1,
    Assets.imagesShop2,
    Assets.imagesShop3,
    Assets.imagesShop4,
  ];
  final categoryImages = const [
    Assets.imagesTshirt1,
    Assets.imagesShorts,
    Assets.imagesPants,
    Assets.imagesJackets,
    Assets.imagesTshirt1,
    Assets.imagesPants,
  ];
  final categoryNames = const [
    "T-Shirt",
    "shorts",
    "Pants",
    "Jackets",
    "T-shirt",
    "Pants",
  ];
  final PageController pageController = PageController();
  // int selectedIndex = 0;
  // final screens = [
  //   FavoritePage(),
  //   OrderPage(),
  //   ShopHomePage(),
  //   OrderDetailsPage()
  // ];
}
