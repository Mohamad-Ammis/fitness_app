import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/workout_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateTimeLine extends StatelessWidget {
  DateTimeLine({
    super.key,
  });
  final controller = Get.put(WorkoutPageController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 10, top: 0),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Text(
                //   '${DateTime.now().year}/${controller.months[DateTime.now().month - 1]}',
                //   style: TextStyle(
                //       fontFamily: Constans.fontFamily,
                //       fontWeight: FontWeight.w500),
                // ),
                Text(
                  '0/4',
                  style: TextStyle(
                      color: Constans.test,
                      fontFamily: Constans.fontFamily,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          EasyDateTimeLine(
            disabledDates: controller.disabledDates(),
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {
              //`selectedDate` the new date selected.
            },
            headerProps: const EasyHeaderProps(
              showHeader: false,
            ),
            dayProps: EasyDayProps(
              width: 60,
              height: 85,
              dayStructure: DayStructure.dayNumDayStr,
              activeDayStyle: DayStyle(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(999)),
                  color: Constans.test,
                ),
              ),
              disabledDayStyle: DayStyle(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(999)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color.fromARGB(255, 124, 182, 245)
                          .withOpacity(0.05),
                      const Color.fromARGB(255, 42, 140, 245).withOpacity(0.05),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
