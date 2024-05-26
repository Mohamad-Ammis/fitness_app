import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer(
      {super.key,
      required this.width,
      required this.height,
      required this.circularRadius, this.margin});
  final double width;
  final double height;
  final double circularRadius;
  final EdgeInsetsGeometry?  margin;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: margin,
        // alignment: Alignment.center,
        width: width,
        height: height,
        decoration:
            BoxDecoration(
        color: Colors.red,
              borderRadius: BorderRadius.circular(circularRadius)),
      ),
    );
  }
}
