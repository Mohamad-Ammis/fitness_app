import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/challenge_model.dart';
import 'package:flutter/material.dart';

class ChallengeGifSection extends StatelessWidget {
  const ChallengeGifSection({
    super.key,
    required this.model,
  });

  final ChallengeModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: MediaQuery.sizeOf(context).height / 3 + 45,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35))),
      child: CachedNetworkImage(
        imageUrl: "${Constans.mainbaseUrlimage}Uploads/${model.gif}",
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
