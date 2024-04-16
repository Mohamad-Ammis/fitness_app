
import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        title,
        style: const TextStyle(
            fontFamily: Constans.fontFamily,
            fontSize: 18,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
