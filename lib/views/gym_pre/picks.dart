import 'dart:async';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/exercontrol.dart';
import 'package:fitnessapp/controller/pickscontroller.dart';
import 'package:fitnessapp/controller/workout_page_controller.dart';
import 'package:fitnessapp/models/exersice.dart';
import 'package:fitnessapp/shimmer/shimmergym.dart';
import 'package:fitnessapp/views/exercises_playing_page/playing_exercise.dart';
import 'package:fitnessapp/views/workout_page/widgets/customsliver.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Picks extends StatefulWidget {
  final String image;
  final String title;
  final String des;
  const Picks(
      {super.key, required this.image, required this.des, required this.title});

  @override
  State<Picks> createState() => _PicksState();
}

class _PicksState extends State<Picks> {
  bool isloading = false;
  final controller = Get.put(Pickscotroller(), permanent: true);
  final control = Get.put(Exercontroller(), permanent: true);

  @override
  void initState() {
    setState(() {
      isloading = true;
    });
    Timer(Duration(seconds: 0), () async {
      try {
        // controller.setspecdayexer();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.89,
            child: sliver_appbar(context),
          ),
          button(context)
        ],
      ),
    ));
  }

  // ignore: non_constant_identifier_names
  CustomScrollView sliver_appbar(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            pinned: true,
            delegate: CustomSliverAppbarDelegate(
                expandedHeight: MediaQuery.of(context).size.height * 0.37,
                img: widget.image,
                title: widget.title,
                des: widget.des,
                picks: true)),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: !isloading
              ? ListView(
                  primary: false,
                  shrinkWrap: true,
                  children: [
                    ...controller.exer.map((item) => allexer(context, item)),
                  ],
                )
              : ListView.builder(
                  itemCount: 4,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (cont, ind) => loadallexer(context)),
        )),
      ],
    );
  }

  Container button(BuildContext context) {
    final workoutController = Get.put(WorkoutPageController());
    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
          onPressed: () {
            workoutController.alltime = 0;
            workoutController.totalCalories = 0;
            control.setexerspesday(controller.exer);
            Get.to(PlayingExercises());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 38, 164, 170),
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
                  fontFamily: "WorkSans",
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
          // color: Colors.amber,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 4,
                ),
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.1,
                //  color: Colors.pink,
                child: Image.network(
                  "http://${Constans.host}:8000/uploads/${item.image}",
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    //  color: Colors.black,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item.name,
                      style: const TextStyle(
                          fontFamily: "WorkSans",
                          fontSize: 19,
                          color: Colors.black),
                    ),
                  ),
                  Text(
                    "00:${item.time}",
                    style: const TextStyle(
                        fontFamily: "WorkSans",
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
                          width: 190,
                          radius: 10)),
                  Shimmergym.Rectangle(
                      height: MediaQuery.of(context).size.height * 0.03,
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
