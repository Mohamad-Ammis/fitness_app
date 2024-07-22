import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/challenge_model.dart';
import 'package:fitnessapp/views/challenges_page/challenges_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewChallengeCard extends StatelessWidget {
  const NewChallengeCard({
    super.key,
    required this.model,
  });
  final ChallengeModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){Get.to(ChallengePage(model:model));},
      child: Container(
        height: 150,
        width: 200,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Constans.test.withAlpha(200),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: 80,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(999))),
                    ),
                    Container(
                      width: 60,
                      height: 40,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Constans.test,
                        borderRadius:
                            const BorderRadius.only(bottomLeft: Radius.circular(999)),
                      ),
                      child: Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          alignment: Alignment.topRight,
                          child:model.image!=null? CachedNetworkImage(imageUrl: 'http://${Constans.host}:8000/Uploads/${model.image}') :const Icon(
                            Icons.home,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name ?? '',
                    style: const TextStyle(
                        fontFamily: Constans.fontFamily,
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Challenge',
                    style: TextStyle(
                        fontFamily: Constans.fontFamily,
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
