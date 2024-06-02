import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Shimmergym extends StatelessWidget {
  final double height;
  final double width ;
  final double radius;

  const Shimmergym.Rectangle({
    required this.height,
    required this.width,
    required this.radius,
  });


  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
       baseColor: Colors.grey[300]!,
       highlightColor:Colors.grey[200]! ,
       child: Container(
        height: height,
        width: width,
       // color: Colors.grey[400]!,
        decoration: ShapeDecoration(
          color:Colors.grey[300]!,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius))
          )),
       )
       );
  }
}