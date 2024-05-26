
import 'package:flutter/material.dart';

class ExerciseGifSection extends StatelessWidget {
  const ExerciseGifSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Image.asset(
          'assets/gif/bench.gif',
          fit: BoxFit.cover,
        ));
  }
}
