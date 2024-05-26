import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/exercise_page_controller.dart';
import 'package:fitnessapp/views/exercise_page/widgets/focuse_area_body_image.dart';
import 'package:fitnessapp/views/exercise_page/widgets/focused_area_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExerciseInfoSection extends StatelessWidget {
  ExerciseInfoSection({
    super.key,
  });
  final exerciseController = Get.put(ExerciseController());
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      // margin: EdgeInsets.only(top: 1),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                // offset: const Offset(0, 0),
                blurRadius: 20,
                spreadRadius: 8,
                color: Colors.black.withOpacity(0.2))
          ],
          color: Colors.white,
          borderRadius: exerciseController.animationActive
              ? const BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32))
              : null),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20,
                    top: exerciseController.animationActive ? 50 : 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bench Press',
                        style: TextStyle(
                            fontFamily: Constans.fontFamily,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ' Very Long Description Very Long Description Very Long Description V Very Long Description Very Long Description Very Long Description Very Long Description Very Long Description Very Long Description Very Long Description Very Long Description Very Long Description Very Long Description',
                        style: TextStyle(
                            height: 1.5,
                            fontFamily: Constans.fontFamily,
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.5)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Focuse Area',
                        style: TextStyle(
                            fontFamily: Constans.fontFamily,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 90,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3, childAspectRatio: 2.7),
                            itemCount: 5,
                            // scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return const FocusedAreaItem();
                            }),
                      ),
                      FocuseAreaBodyImage(
                        muscle: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (Get.isBottomSheetOpen ?? false) {
                Get.back();
              }
            },
            child: Container(
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(16),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  color: Constans.test.withAlpha(170)),
              child: const Center(
                  child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'E X I T',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: Constans.fontFamily,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
