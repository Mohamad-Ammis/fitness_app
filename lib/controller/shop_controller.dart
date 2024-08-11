// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'dart:convert';

import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/helper/custom_toast_notification.dart';
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
  ];
  final categoryImages = const [
    Assets.imagesTshirt1,
    Assets.imagesShorts,
    Assets.imagesPants,
  ];
  final categoryNames = const [
    "shorts",
    "pants",
    "shirts",
    "T-shirts",
    "socks",
  ];
  final filterNames = const [
    "Clothes",
    "Sports",
    "food",
  ];
  bool buyNow = false;
  bool checkout = false;
  final PageController pageController = PageController();
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
    // ignore: unused_local_variable
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

  List<AdsModel> adsList = [];
  bool adsLoading = false;
  Future getAllAds() async {
    adsLoading = true;
    update();
    final response = await http
        .get(Uri.parse('${Constans.baseUrl}products/poster/all'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${userInfo!.getString('token')}'
    });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      adsList = [];
      for (var i = 0; i < data['data'].length; i++) {
        adsList.add(AdsModel.fromJson(data['data'][i]));
      }
      adsLoading = false;
      update();
      return adsList;
    } else {
      debugPrint('error when get all Ads');
      return;
    }
  }

  List<ProductModel> cartProducts = [];
  double cartSubTotal = 0;
  List<String> categoriesApiNames = const [
    "Clothes",
    "Sports_equipment",
    "Food_Supplements"
  ];
  List viewAllProducts = [];
  List tempViewAllProducts = [];
  bool viewAllProductsLoading = false;

  Future getProdutcWithCategory(String cat) async {
    viewAllProductsLoading = true;
    update();
    final response = await http.post(
        Uri.parse('${Constans.baseUrl}products/catWithProduct'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userInfo!.getString('token')}'
        },
        body: {
          'category': cat,
        });
    var data = jsonDecode(response.body);
    debugPrint('All Products: $data');
    if (response.statusCode == 200) {
      viewAllProductsLoading = false;
      viewAllProducts = data['data']['products'];
      tempViewAllProducts = data['data']['products'];
      update();
      return data['data']['products'];
    } else {
      debugPrint('error when get all Ads');
      return;
    }
  }

  bool selected = false;
  int selectedIndex = -1;

  bool errorWhenSearch = false;
  List searchList = [];
  bool searchLoading = false;
  Future productsSearch(String searchText, category) async {
    searchLoading = true;
    update();
    final response =
        await http.post(Uri.parse('${Constans.baseUrl}products/search'),
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer ${userInfo!.getString('token')}'
            },
            body: selectedIndex != -1
                ? {
                    'search_text': searchText,
                    'category': categoryNames[selectedIndex],
                    'home_Category': category,
                  }
                : {'search_text': searchText, 'home_Category': category});
    var data = jsonDecode(response.body);
    debugPrint('All Products: $data');
    if (response.statusCode == 200) {
      searchLoading = false;
      errorWhenSearch = false;
      searchList = data['data'];
      update();
      debugPrint('searchList: $searchList');
      return data['data'];
    } else {
      debugPrint('error when get all Ads');
      errorWhenSearch = true;
      searchList = [];
      update();
      return;
    }
  }

  Future productsCategorySearch() async {
    searchLoading = true;
    update();
    final response = await http.post(
        Uri.parse('${Constans.baseUrl}products/search'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userInfo!.getString('token')}'
        },
        body: selectedIndex != -1
            ? {
                'category': categoryNames[selectedIndex],
                'home_Category': 'Clothes'
              }
            : {'home_Category': 'Clothes'});
    var data = jsonDecode(response.body);
    debugPrint('All Products: $data');
    if (response.statusCode == 200) {
      searchLoading = false;
      errorWhenSearch = false;
      searchList = data['data'];
      update();
      debugPrint('searchList: $searchList');
      return data['data'];
    } else {
      debugPrint('error when get all Ads');
      errorWhenSearch = true;
      searchList = [];
      update();
      return;
    }
  }

  List<Map<String, String>> orderCartProducs = [];
  Future createOrder(List<Map<String, String>>? products, context) async {
    final response = await http.post(
      Uri.parse('${Constans.baseUrl}products/order/create'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${userInfo!.getString('token')}',
      },
      body: products == null
          ? jsonEncode({
              'products': orderCartProducs,
            })
          : jsonEncode({
              'products': products,
            }),
    );

    var data = jsonDecode(response.body);
    debugPrint('order: $data');
    if (response.statusCode == 200) {
      Get.snackbar(
          'order Created Successfully', 'we hope you are happy with us');
      cartProducts = [];
      orderCartProducs = [];
      cartSubTotal = 0;
      update();
      return data['data'];
    } else {
      debugPrint('Failed with status code: ${response.statusCode}');
      debugPrint('Response: ${response.body}');
      showErrorSnackBar('Error Happened', "there is products out of stock")
        ..show(context);

      return '';
    }
  }

  Future payOrder(orderID) async {
    final response = await http
        .post(Uri.parse('${Constans.baseUrl}products/order/pay'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${userInfo!.getString('token')}',
    }, body: {
      'order_id': orderID
    });
    var data = jsonDecode(response.body);
    debugPrint('data: ${data}');
    if (response.statusCode == 200) {
      return data['Data']['InvoiceURL'];
    } else {
      debugPrint('error on invoice');
      debugPrint('data: $data');
      return '';
    }
  }

  Future getAllOrders() async {
    final response = await http
        .get(Uri.parse('${Constans.baseUrl}products/order/index'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${userInfo!.getString('token')}'
    });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      debugPrint('orders: ${data['data']}');

      return data['data'];
    } else {
      debugPrint('Error when get orders');
      return [];
    }
  }

  bool cancelOrderLoading = false;
  Future cancelOrder(id, context) async {
    cancelOrderLoading = true;
    update();
    final response = await http.delete(
        Uri.parse('${Constans.baseUrl}products/order/cancel/${id.toString()}'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userInfo!.getString('token')}'
        });
    cancelOrderLoading = false;
    update();
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      showSuccesSnackBar('تم بنجاح', data['message'].toString()).show(context);
      return true;
    } else {
      showErrorSnackBar('حدث خطأ', data['message'].toString()).show(context);
      return false;
    }
  }

  Future showProduct(id) async {
    final response = await http.get(
        Uri.parse('${Constans.baseUrl}products/getByid/${id.toString()}'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userInfo!.getString('token')}'
        });
    debugPrint(jsonDecode(response.body).toString());
  }

  @override
  onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      allProducts = await getAllProduct();
      debugPrint('allProducts: ${allProducts.length}');
      commonProducts = await getCommonProduct();
      debugPrint('commonProducts: ${commonProducts.length}');
      mostSalesProducts = await getMostSalesProduct();
      debugPrint('mostSalesProducts: ${mostSalesProducts.length}');
      showedList = allProducts;
      await getAllAds();
      update();
      debugPrint('allAds: ${adsList.length}');
    });
  }
}
