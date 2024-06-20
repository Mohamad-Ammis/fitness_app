import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/exersice.dart';
import 'package:fitnessapp/views/exercise_page/widgets/exercise_page_body.dart';
import 'package:fitnessapp/views/exercises_playing_page/widgets/bottom_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayingExercisePage extends StatelessWidget {
  const PlayingExercisePage({
    super.key,
    required this.innerPageController,
    required this.outerPageController, required this.index, required this.lastIndex, required this.model,
  });
  final int index;
  final int lastIndex;
  final PageController innerPageController;
  final PageController outerPageController;
  final ExerciseModel model;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height / 3 * 2,
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.1))),
          child: CachedNetworkImage(
  imageUrl: "http://${Constans.host}:8000/Uploads/${model.image}",
  imageBuilder: (context, imageProvider) => Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
          ))),
        ),),
        Positioned(
            top: 40,
            right: 10,
            child: IconButton(
                onPressed: () {
                  Get.bottomSheet(
                      enterBottomSheetDuration: const Duration(milliseconds: 700),
                      exitBottomSheetDuration: const Duration(milliseconds: 700),
                      isScrollControlled: true,
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height - 50,
                          child: ExercisePageBody(model: model,)));
                },
                icon: const Icon(
                  Icons.info_outline,
                  size: 30,
                  color: Colors.black,
                ))),
        BottomPageView(innerPageController: innerPageController, outerPageController: outerPageController, index: index, lastIndex: lastIndex, model: model,),
      ],
    );
  }
}

