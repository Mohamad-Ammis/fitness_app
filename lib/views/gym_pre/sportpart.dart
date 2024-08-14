import 'dart:async';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/exercontrol.dart';
import 'package:fitnessapp/controller/spec_day_controller.dart';
import 'package:fitnessapp/controller/workout_page_controller.dart';
import 'package:fitnessapp/models/exersice.dart';
import 'package:fitnessapp/shimmer/shimmergym.dart';
import 'package:fitnessapp/views/exercises_playing_page/playing_exercise.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sportpart extends StatefulWidget {
  final int id;
  const Sportpart({super.key, required this.id});

  @override
  State<Sportpart> createState() => _SportpartState();
}

class _SportpartState extends State<Sportpart> {
  final controller = Get.put(SpecDay(), permanent: true);
  final control = Get.put(Exercontroller(), permanent: true);

  bool isloading = false;
  @override
  void initState() {
    setState(() {
      isloading = true;
    });
    Timer(Duration(seconds: 0), () async {
      try {
        controller.setspecdayexer();
        await controller.getexer();
      } catch (error) {
        showDialog(
            context: context,
            builder: (ctxx) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  title: const Text(
                    'Warning',
                    style: TextStyle(
                        color: Color.fromARGB(255, 252, 93, 93), fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  content: Text(error.toString()),
                ));
      }
      setState(() {
        isloading = false;
      });
    });
    super.initState();
  }

  List<ExerciseModel> exercise = [];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, contr) => Column(
              children: [
                SizedBox(
                  height: contr.maxHeight * 0.02,
                ),
                SizedBox(
                  height: contr.maxHeight * 0.85,
                  child: isloading == false
                      ? ListView(
                          children: [
                            ...controller.exer
                                .map((item) => allexer(context, item)),
                          ],
                        )
                      : ListView.builder(
                          itemCount: 4,
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (cont, ind) => loadallexer(context)),
                ),
                button(context, contr)
              ],
            ));
  }

  Container button(BuildContext context, BoxConstraints cont) {
    final workoutController = Get.put(WorkoutPageController());
    return Container(
      height: cont.maxHeight * 0.13,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
          onPressed: () {
            control.setexerspesday(controller.exer);
            workoutController.alltime = 0;
            workoutController.totalCalories = 0;

            Get.to(PlayingExercises(
                  isCoachExercise: true,
                ));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 50, 144, 173),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            height: 60,
            width: 250,
            child: const Text(
              "start",
              style: TextStyle(
                  fontFamily: Constans.fontFamily,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          )),
    );
  }

  Column allexer(BuildContext context, ExerciseModel item) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 0, bottom: 5, left: 15, right: 15),
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 4,
                ),
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Image.network(
                  "${Constans.mainbaseUrlimage}uploads/${item.image}",
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item.name,
                      style: const TextStyle(
                          fontFamily: Constans.fontFamily,
                          fontSize: 19,
                          color: Colors.black),
                    ),
                  ),
                  Text(
                    "00:${item.time}",
                    style: const TextStyle(
                        fontFamily: Constans.fontFamily,
                        fontSize: 16,
                        color: Colors.black54),
                  )
                ],
              ))
            ],
          ),
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Divider())
      ],
    );
  }

  Column loadallexer(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 0, bottom: 5, left: 15, right: 15),
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 4, left: 16, right: 16),
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Shimmergym.Rectangle(
                    height: MediaQuery.of(context).size.height * 0.1,
                    cc: Colors.grey[300],
                    width: MediaQuery.of(context).size.width * 0.25,
                    radius: 30),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      alignment: Alignment.centerLeft,
                      child: Shimmergym.Rectangle(
                          height: MediaQuery.of(context).size.height * 0.04,
                          cc: Colors.grey[300],
                          width: 190,
                          radius: 10)),
                  Shimmergym.Rectangle(
                      height: MediaQuery.of(context).size.height * 0.03,
                      cc: Colors.grey[300],
                      width: 60,
                      radius: 10)
                ],
              ))
            ],
          ),
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Divider())
      ],
    );
  }
}
