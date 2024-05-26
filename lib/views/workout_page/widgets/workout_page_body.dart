import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/workout_page_controller.dart';
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
                    'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTZmZDYwYTllMTEwNTcwOTFkZTFmZmNlMWZlNjdkMWQ3NGI3MGUwZTkyODM2NDcyZjdkZjRjMGZjYmNiOTU5ZTM1MmQ5YzY1MTg3N2M4MGIiLCJpYXQiOjE3MTY1NjQ1NTQuODk5Mjg2LCJuYmYiOjE3MTY1NjQ1NTQuODk5Mjg5LCJleHAiOjE3NDgxMDA1NTQuODMyMzY5LCJzdWIiOiIxIiwic2NvcGVzIjpbInVzZXIiXX0.qyxx5mev00VKANpY5NDezGyY3ggtRLYXf7sXKGKvmWKcW1Puq5XipRB2yAUmKVzy6632-5bKr-lArJEviw7U_O2-BjtaIWrOJQ7wyR6nT8715jr0cP3Ofmz8LdddDL9eKHH-TK1OeMEzKAVqyoYzOprZBWzYlxTOkiWqohDu_hn7Sch2zDktBiEp2ssW8Tb9lSEfjsyz8l10HySVNfAKJzCwY7pij4wy8_PzVAB2vfi0q0UrjL4jld010bTYpBoyUEW8WXe7joZW-i8m68FnwPoG3MbLF8eRsHdsDQzDOTlxXPvaN6PYTiWjsY9z4IKiHn54BlAJQWO14Ma2PpS_a9csTyTuDFya_ryLyIXNWFy3rTAMoMt8BHTRnomaWbBdb5ysQmPFvNLxw87e4c1g0JOtpF_BDl0HIIxkyX065oCEMwYwMKpkmjB_9bf_MfyHmmyEn1DyHwelQQ59lzWFwgkU5iHaPFxi-iCgdWwBg-FPGStecc6THT6sopskpsDl6TFOP76mAKp8isdfzVAriHBqI4NY358afTAjX-iY6aYG7-JZdkY0XRD35te0nKxVboX3P7uahFoDjVFIajUr74z8WwpcBEAOQgLWpEzA0u5QUJSPcJehzEgcvAu32SKvrN4lc-xdBGvUdjwnLcy4SeV4KI8bSmAaxbiYWims_LA',
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
