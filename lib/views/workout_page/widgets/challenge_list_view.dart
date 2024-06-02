import 'package:fitnessapp/controller/workout_page_controller.dart';
import 'package:fitnessapp/models/challenge_model.dart';
import 'package:fitnessapp/views/workout_page/widgets/new_challenge_card.dart';
import 'package:fitnessapp/widgets/shimmer/shimmer_custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChallengesListView extends StatelessWidget {
   ChallengesListView({
    super.key,
    required this.data,
  });

  final dynamic data;
  final controller=Get.put(WorkoutPageController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkoutPageController>(
      builder: (controller) {
        return SizedBox(
          height: 160,
          child: ListView.builder(
              itemCount:controller.shimmerLoading?3: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return  controller.shimmerLoading?
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ShimmerContainer(width: 200, height: 150, circularRadius: 12,),
                ):
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NewChallengeCard(model:ChallengeModel.fromJson(data[index])),
                );
                // return WorkoutChallengeCard(
                //   image: images[index],
                // );
              }),
        );
      }
    );
  }
}
