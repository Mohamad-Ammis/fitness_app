// ignore_for_file: camel_case_types

import 'package:fitnessapp/views/workout_page/test.dart';
import 'package:flutter/material.dart';

class testt extends StatelessWidget {
  const testt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Test(muscle: const [1,2,3,4,5,6,7,8,9,10],),
      ),
    );
  }
}

