import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPageController extends GetxController {
  int selectedColor=-1;
  int selectedSize=-1;
   var productColors = const [
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.white,
    Colors.teal
  ];
  List<String>productSizes=const[
    "S",
    "M",
    "L",
    "XL",
    "XXL",
  ];
}
