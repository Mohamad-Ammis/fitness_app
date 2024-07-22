import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/utils/app_images.dart';
import 'package:flutter/material.dart';

class FavoritePageCard extends StatelessWidget {
  const FavoritePageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 10, color: Colors.black.withOpacity(.3))
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  Assets.imagesClothes2,
                  fit: BoxFit.cover,
                  height: 150,
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Text(
                          "Men Jackets  ",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontFamily: Constans.fontFamily,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "A product  description is a form of marketing copy used to describe and explain the benefits of your product ",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(
                            fontFamily: Constans.fontFamily,
                            fontSize: 14,
                            color: Colors.black.withOpacity(.5),
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned.fill(
            child: Align(
          alignment: Alignment.topRight,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16))),
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(8),
            child: const Icon(
              color: Colors.white,
              Icons.remove,
            ),
          ),
        ))
      ],
    );
  }
}
