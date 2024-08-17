import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/models/muscle.dart';
import 'package:fitnessapp/views/workout_page/exer.dart';
import 'package:fitnessapp/views/workout_page/widgets/exercise_card_header.dart';
import 'package:fitnessapp/views/workout_page/widgets/exercises_card_body.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ExcercisesCard extends StatelessWidget {
  const ExcercisesCard({
    super.key,
    required this.model,
  });
  final Muscle model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(Exercise(
            image: userInfo!.getInt("man") == 1
                ? model.muscleImageMan!
                : model.muscleImageWoman!,
            title: model.muscleName!,
            des: model.dess!,
            id: model.id.toString(),
            level: model.level));
      },
      child: Container(
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        height: 150,
        constraints: const BoxConstraints(minHeight: 140, maxHeight: 180),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2),
                spreadRadius: 2,
                blurRadius: 5,
                color: Colors.grey.withOpacity(0.2))
          ],
        ),
        child: Stack(
          children: [
            CachedNetworkImage(
                imageUrl:
                    "${Constans.mainbaseUrlimage}Uploads/${userInfo!.getInt("man") == 1 ? model.muscleImageMan! : model.muscleImageWoman!}",
                imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter: const ColorFilter.mode(
                              Color.fromARGB(255, 10, 0, 0),
                              BlendMode.lighten)),
                    ))),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: ExerciseCardHeader(model: model),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: ExerciseCardBody(model: model),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
