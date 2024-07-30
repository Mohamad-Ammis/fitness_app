import 'dart:convert';

import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/models/shop/ads_model.dart';
import 'package:fitnessapp/models/shop/product_model.dart';
import 'package:fitnessapp/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
  int filterProductSelectedIndex = 0;
  Future<List<dynamic>> getAllProduct() async {
    const url = '${Constans.baseUrl}products/allProducts';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userInfo!.getString('token')}',
      },
    );

    var data = jsonDecode(response.body);
    return data['data'];
  }

  Future<List<dynamic>> getCommonProduct() async {
    const url = '${Constans.baseUrl}products/common';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userInfo!.getString('token')}',
      },
    );

    var data = jsonDecode(response.body);

    return data['data'];
  }

  Future<List<dynamic>> getMostSalesProduct() async {
    const url = '${Constans.baseUrl}products/mostSales';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userInfo!.getString('token')}',
      },
    );
    var data = jsonDecode(response.body);
    return data['data'];
  }

  List allProducts = [];
  List commonProducts = [];
  List mostSalesProducts = [];
  List showedList = [];

  List favoriteProducts = [];
  Future<List<dynamic>> getFavoritesProduct() async {
    const url = '${Constans.baseUrl}products/GetFavoritesList';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userInfo!.getString('token')}',
      },
    );
    var data = jsonDecode(response.body);
    return data['products'];
  }

  Future<void> addToFavorites(String id, BuildContext context) async {
    var url = '${Constans.baseUrl}products/AddproductToFavoritesList/$id';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userInfo!.getString('token')}',
      },
    );
  }

  Future<bool> deleteFromFavorites(String id, BuildContext context) async {
    var url = '${Constans.baseUrl}products/deleteFromFavorite/$id';
    final response = await http.delete(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userInfo!.getString('token')}',
      },
    );
    if (response.statusCode == 200) {
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(
      //       content: Text('Deleted from Favorites'))
      //       );
      return true;
    } else {
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(

      //       content: Text('Error Happened')));
      return false;
    }
  }

  Future<bool> checkIfIsFavorites(String id, BuildContext context) async {
    var url = '${Constans.baseUrl}products/$id/isfav';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userInfo!.getString('token')}',
      },
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json['isfavorite'] == true) {
        return true;
      }
      return false;
    } else {
      throw Exception();
    }
  }

  List<AdsModel> allAds = [];
  Future getAllAds() async {
    allAds = [];
    final response = await http.get(
      Uri.parse('${Constans.baseUrl}products/poster/all'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userInfo!.getString('token')}',
      },
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      debugPrint('data: ${data}');
      for (var i = 0; i < data['data'].length; i++) {
        allAds.add(AdsModel.fromJson(data['data'][i]));
      }
      debugPrint('allAds: ${allAds}');
      return allAds;
    } else {
      debugPrint('error when get ads');
      return [];
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    allProducts = await getAllProduct();
    debugPrint('allProducts: ${allProducts.length}');
    commonProducts = await getCommonProduct();
    debugPrint('commonProducts: ${commonProducts.length}');
    mostSalesProducts = await getMostSalesProduct();
    debugPrint('mostSalesProducts: ${mostSalesProducts.length}');
    showedList = allProducts;
    allAds = await getAllAds();
    debugPrint('allAds: ${allAds.length}');
    update();
  }
}
