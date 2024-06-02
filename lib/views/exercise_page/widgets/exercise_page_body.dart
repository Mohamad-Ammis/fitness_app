import 'package:fitnessapp/controller/exercise_page_controller.dart';
import 'package:fitnessapp/models/exersice.dart';
import 'package:fitnessapp/views/exercise_page/widgets/exercise_gif_section.dart';
import 'package:fitnessapp/views/exercise_page/widgets/exercise_info_section.dart';
import 'package:fitnessapp/views/exercise_page/widgets/middle_info_bar.dart';
import 'package:fitnessapp/views/exercise_page/widgets/upper_tap_bar.dart';
import 'package:fitnessapp/views/exercise_page/widgets/youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExercisePageBody extends StatelessWidget {
  const ExercisePageBody({
    super.key, required this.model,
  });
  final ExerciseModel model;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExerciseController>(
        init: ExerciseController(),
        builder: (exerciseControlller) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35))),
            child: Stack(
              children: [
                Column(
                  children: [
                    TapbarSection(),
                    Expanded(
                        flex: 2,
                        child: exerciseControlller.animationActive
                            ? ExerciseGifSection(model:model)
                            : YoutubePlayerSection(url:model.video_link)),
                    Expanded(
                      flex: 4,
                      child: ExerciseInfoSection(model:model),
                    ),
                    
                  ],
                ),
                exerciseControlller.hideMiddleBar?
                Container():MiddleInfoBar(model: model,)
              ],
            ),
          );
        });
  }
}
