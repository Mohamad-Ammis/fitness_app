import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

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
            index != 0
                ? Container(
                    alignment: Alignment.center,
                    width: MediaQuery.sizeOf(context).width / 3,
                    child: GestureDetector(
                      onTap: () {
                        outerPageController.previousPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.linear);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.skip_previous_sharp,
                              color: Colors.black.withOpacity(0.3)),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Previous",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.3),
                              fontFamily: Constans.fontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            (index != lastIndex - 1 && index != 0)
                ? VerticalDivider(
                    indent: 4,
                    endIndent: 4,
                    color: Colors.black.withOpacity(0.2),
                  )
                : Container(),
            index != lastIndex - 1
                ? Container(
                    width: MediaQuery.sizeOf(context).width / 3,
                    child: GestureDetector(
                      onTap: () {
                        outerPageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.linear);
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
                  )
                : const Text(''),
          ],
        )
      ),
    );
  }
}
