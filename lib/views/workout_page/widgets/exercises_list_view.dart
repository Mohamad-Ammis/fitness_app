import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/controller/workout_page_controller.dart';
import 'package:fitnessapp/views/workout_page/widgets/exercises_card.dart';
import 'package:fitnessapp/widgets/shimmer/shimmer_custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExercisesListView extends StatelessWidget {
  ExercisesListView({
    super.key,
  });

  final controller = Get.put(WorkoutPageController());
  final dataController = Get.put(Datacontroller());

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<WorkoutPageController>(
      builder: (controller) {
        return ListView.builder(
                  itemCount:controller.shimmerLoading?3: controller.finalList.length,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return !controller.shimmerLoading?
                     ExcercisesCard(model: controller.finalList[index],)
                    :ShimmerContainer(
                      width: MediaQuery.sizeOf(context).width,
                      height: 150,
                      circularRadius: 12,
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    );
                  });
      }
    );
        
  }
}
