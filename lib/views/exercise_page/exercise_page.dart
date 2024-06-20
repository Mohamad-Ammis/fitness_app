import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';

// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back),
        title: const Text(
          'Exercise',
          style: TextStyle(fontFamily: Constans.fontFamily),
        ),
        actions: [
          const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.favorite_outlined,
                color: Colors.black,
              ))
        ],
        centerTitle: true,
      ),
      body:Container(),
    );
  }
}
