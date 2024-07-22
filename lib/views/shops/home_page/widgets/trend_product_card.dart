import 'package:fitnessapp/utils/app_images.dart';
import 'package:flutter/material.dart';

class TrendProductCard extends StatelessWidget {
  const TrendProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(28)),
        child: Stack(
          children: [
            Image.asset(
              Assets.imagesMenClothing,
              fit: BoxFit.fitHeight,
              width: double.infinity,
              height: double.infinity,
              opacity: const AlwaysStoppedAnimation(.75),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(999),
                              color: Colors.black.withOpacity(0.15)),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.white.withOpacity(.9),
                              )))
                    ],
                  ),
                ),
                const SizedBox(),
                // Container(
                //   padding: EdgeInsets.fromLTRB(8, 4, 8, 12),
                //   width: double.infinity,
                //   color: Colors.black.withOpacity(.15),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Row(
                //         mainAxisAlignment:
                //             MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             "Mens Jackets",
                //             style: TextStyle(
                //                 height: 0,
                //                 fontFamily: Constans.fontFamily,
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.w600,
                //                 color: Colors.white
                //                     .withOpacity(.95)),
                //           ),
                //           Text(
                //             "40\$",
                //             style: TextStyle(
                //                 height: 0,
                //                 fontFamily: Constans.fontFamily,
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w600,
                //                 color: Colors.white
                //                     .withOpacity(.95)),
                //           ),
                //         ],
                //       ),
                //       Text(
                //         "Pants",
                //         style: TextStyle(
                //             height: 0,
                //             fontFamily: Constans.fontFamily,
                //             fontSize: 12,
                //             fontWeight: FontWeight.w400,
                //             color: Colors.white.withOpacity(.6)),
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
            Positioned.fill(
                child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.3),
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(16))),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
            ))
          ],
        ));
  }
}
