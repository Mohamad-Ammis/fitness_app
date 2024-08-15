import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersPageView extends StatefulWidget {
  const OffersPageView({
    super.key,
    required this.dotPageController,
    required this.adsList,
  });
  final PageController dotPageController;
  final dynamic adsList;

  @override
  State<OffersPageView> createState() => _OffersPageViewState();
}

class _OffersPageViewState extends State<OffersPageView> {
  int currentIndex = 0;
  Timer? _timer;
  final ShopController controller = Get.put(ShopController());

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
    widget.dotPageController.addListener(_userScrollListener);
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.dotPageController.removeListener(_userScrollListener);
    super.dispose();
  }

//function to handle ads scroll
  void _startAutoSlide() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (widget.dotPageController.hasClients) {
        final nextPage = (currentIndex + 1) %
(controller.adsList.isEmpty ? 0 : controller.adsList.length);
        widget.dotPageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _userScrollListener() {
    if (widget.dotPageController.page!.toInt() != currentIndex) {
      currentIndex = widget.dotPageController.page!.toInt();
      _startAutoSlide();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      child: PageView.builder(
          controller: widget.dotPageController,
          itemCount: controller.adsList.isEmpty
              ? controller.images.length
              : controller.adsList.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                controller.adsList.isEmpty
                    ? Image.asset(
                        width: double.infinity,
                        controller.images[index],
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        imageUrl:
                            "${Constans.mainbaseUrlimage}Uploads/${controller.adsList[index].image}",
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
              ],
            );
          }),
    );
  }
}
