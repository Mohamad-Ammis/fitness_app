import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/controller/workout_page_controller.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/views/workout_page/widgets/challenge_list_view.dart';
import 'package:fitnessapp/views/workout_page/widgets/date_time_line.dart';
import 'package:fitnessapp/views/workout_page/widgets/exercises_category_list_view.dart';
import 'package:fitnessapp/views/workout_page/widgets/exercises_list_view.dart';
import 'package:fitnessapp/views/workout_page/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class WorkoutPageBody extends StatelessWidget {
  WorkoutPageBody({
    super.key,
  });
  final controller = Get.put(WorkoutPageController());
  final Datacontrol = Get.put(Datacontroller());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height - 182,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DateTimeLine(),
            const SectionTitle(title: 'CHALLENGES'),
            FutureBuilder(
                future: controller.getChallenge(
                    preference!.getString('token'),
                    'http://${Constans.host}:8000/api/trainer/challenge/getAll'),
                builder: (context, snapshot) {
                  return ChallengesListView(data: snapshot.data);
                }),
            const SectionTitle(title: 'EXERCISES'),
            ExercisesCategoryListView(),
            ExercisesListView()
          ],
        ),
      ),
    );
  }
}
