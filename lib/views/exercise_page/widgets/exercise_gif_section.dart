import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/exersice.dart';
import 'package:flutter/material.dart';

class ExerciseGifSection extends StatelessWidget {
  const ExerciseGifSection({
    super.key,
    required this.model,
  });
  final ExerciseModel model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CachedNetworkImage(
        imageUrl: "${Constans.mainbaseUrlimage}Uploads/${model.image}",
        imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
                image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ))),
      ),
    );
  }
}
