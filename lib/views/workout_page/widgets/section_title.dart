
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/workout_page_controller.dart';
import 'package:fitnessapp/widgets/shimmer/shimmer_custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkoutPageController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child:controller.shimmerLoading? const ShimmerContainer(width:80,height:30,circularRadius: 12,): Text(
            title,
            style: const TextStyle(
                fontFamily: Constans.fontFamily,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        );
      }
    );
  }
}

