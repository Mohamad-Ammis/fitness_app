import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomTimeLineTile extends StatelessWidget {
  const CustomTimeLineTile(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.eventCard});
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final Widget? eventCard;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      height: 150,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
            color: isPast ? Constans.shopColor : Constans.shopLightColor),
        // afterLineStyle: LineStyle(color: Colors.blue),
        indicatorStyle: IndicatorStyle(
            width: 40,
            color: isPast ? Constans.shopColor : Constans.shopLightColor,
            iconStyle: IconStyle(
                iconData: Icons.done,
                color: isPast ? Colors.white : Colors.white.withOpacity(.3))),
        endChild: eventCard,
      ),
    );
  }
}
