import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/playing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomTapBar extends StatelessWidget {
  const BottomTapBar({
    super.key,
    required this.index,
    required this.lastIndex,
    required this.outerPageController,
  });
  final int index;
  final int lastIndex;
  final PageController outerPageController;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayingController>(
        init: PlayingController(),
        builder: (controller) {
          return Positioned(
            bottom: 0,
            child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 15,
                        spreadRadius: 10,
                        color: Colors.black.withOpacity(0.05))
                  ],
                ),
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (index != lastIndex - 1 && index != 0)
                        ? VerticalDivider(
                            indent: 4,
                            endIndent: 4,
                            color: Colors.black.withOpacity(0.2),
                          )
                        : Container(),
                    index != lastIndex - 1
                        ? SizedBox(
                            width: MediaQuery.sizeOf(context).width / 3,
                            child: GestureDetector(
                              onTap: () {
                                outerPageController.nextPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.linear);
                              },
                              child: GestureDetector(
                                onTap: () {
                                  outerPageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.linear);
                                  controller.nextPressed = true;
                                  controller.update();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Next",
                                      style: TextStyle(
                                          fontFamily: Constans.fontFamily,
                                          fontSize: 20,
                                          color: Colors.black.withOpacity(0.3),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.skip_next,
                                        color: Colors.black.withOpacity(0.3)),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : const Text(''),
                  ],
                )),
          );
        });
  }
}
