// ignore: must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/favorites_controller.dart';
import 'package:fitnessapp/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

// ignore: must_be_immutable
class MealPage extends StatefulWidget {
  Meal meal = Meal();

  MealPage({super.key, required this.meal});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  int currentindex = 0;

  ControllerFavorite cardController3 =
      Get.put(ControllerFavorite(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constans.screen,
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 460,
              ),
              ClipPath(
                  clipper: TopWidgetClipper(),
                  child: Container(
                      color: Colors.black,
                      height: 460,
                      width: MediaQuery.of(context).size.width,
                      child: Opacity(
                          opacity: 0.6,
                          child: CachedNetworkImage(
                              imageUrl:
                                  "${Constans.mainbaseUrlimage}uploads/${widget.meal.image}",
                              fit: BoxFit.cover)
                          //  Image.asset("assets/images/chicken.jpg",
                          ))),
              GetBuilder<ControllerFavorite>(builder: (controller) {
                return Positioned(
                    right: MediaQuery.of(context).size.width * 0.12,
                    bottom: 45,
                    child: Container(
                        height: 55,
                        width: 60,
                        padding: const EdgeInsets.only(left: 2, right: 2),
                        decoration: BoxDecoration(
                            color: const Color(0xFFF4365C),
                            borderRadius: BorderRadius.circular(40)),
                        child: IconButton(
                            onPressed: () {
                              if (widget.meal.isfavorite == false) {
                                cardController3
                                    .addToFavorites(widget.meal.id!)
                                    .then((value) {
                                  widget.meal.isfavorite = true;
                                  cardController3.update();
                                });
                              } else {
                                cardController3
                                    .removeFavorites(widget.meal.id!)
                                    .then((value) {
                                  widget.meal.isfavorite = false;
                                  cardController3.update();
                                });
                              }
                            },
                            icon: Icon(
                                widget.meal.isfavorite == true
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 40,
                                color: Colors.white))));
              }),
              Positioned(
                  top: 25,
                  left: 15,
                  child: Container(
                      height: 47,
                      width: 47,
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(40)),
                      padding: const EdgeInsets.only(right: 4),
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 30,
                          )))),
              Positioned(
                  top: 32,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Text(
                      widget.meal.name!,
                      style: const TextStyle(
                          fontSize: 26, //26//
                          fontFamily: Constans.fontFamily,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              widget.meal.warning != null
                  ? Positioned(
                      top: 25,
                      right: 0,
                      left: 320,
                      child: TextButton(
                        onPressed: () {
                          QuickAlert.show(
                              confirmBtnText: "Ok",
                              confirmBtnColor: const Color(0xff007d81),
                              barrierDismissible: false,
                              barrierColor: Colors.white.withOpacity(0.9),
                              context: context,
                              type: QuickAlertType.warning,
                              widget: SingleChildScrollView(
                                child: Text(
                                  widget.meal.warning!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: Constans.fontFamily,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              title: 'Warning!',
                              titleColor: const Color(0xff007d81));
                        },
                        child: const Image(
                          image: AssetImage("assets/images/warning.png"),
                          height: 34,
                          width: 34,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 23),
            child: Text(
              "Description",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: Constans.fontFamily,
                  color: Color(0xff274c78),
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 33, bottom: 25),
            child: SingleChildScrollView(
              child: Text(
                widget.meal.description!,
                // maxLines: 35,
                // overflow: TextOverflow.ellipsis,
                // softWrap: true,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: "Lora",
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(children: [
                Container(
                  padding: const EdgeInsets.only(left: 50, top: 5, bottom: 5),
                  height: 60,
                  width: 120,
                  decoration: const BoxDecoration(
                    color: Constans.foodblue,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.8),
                    radius: 15,
                    child: const Image(
                      image: AssetImage("assets/images/muscle.png"),
                      color: Constans.foodblue,
                      height: 23,
                      width: 23,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 15,
                  child: Column(
                    children: [
                      Text(
                        widget.meal.calories!,
                        // "${widget.kal!}kal",
                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: Constans.fontFamily,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "cal",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: Constans.fontFamily,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              Stack(children: [
                Container(
                  padding: const EdgeInsets.only(left: 50, top: 5, bottom: 5),
                  height: 60,
                  width: 120,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 121, 147, 178),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.8),
                    radius: 15,
                    child: const Icon(
                      Icons.local_fire_department_rounded,
                      color: Constans.foodblue,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 15,
                  child: Column(
                    children: [
                      Text(
                        widget.meal.protein!,
                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: Constans.fontFamily,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "g",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: Constans.fontFamily,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ],
          ),
          widget.meal.ingredient == null || widget.meal.ingredient!.isEmpty
              ? Container(
                  padding: const EdgeInsets.only(top: 20),
                )
              : const Padding(
                  padding: EdgeInsets.only(left: 23, top: 25),
                  child: Text(
                    "Ingredients",
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: Constans.fontFamily,
                        color: Color(0xff274c78),
                        fontWeight: FontWeight.bold),
                  ),
                ),
          widget.meal.ingredient == null || widget.meal.ingredient!.isEmpty
              ? Container()
              : SizedBox(
                  height: 185,
                  child: ListView.builder(
                      padding: const EdgeInsets.only(left: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.meal.ingredient!.length,
                      itemBuilder: (context, ind) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              height: 120,
                              width: 120,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 121, 147, 178),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${Constans.mainbaseUrlimage}uploads/${widget.meal.ingredient![ind].image}",
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                widget.meal.ingredient![ind].name!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: Constans.fontFamily,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ]),
                        );
                      }),
                ),
          const Padding(
            padding: EdgeInsets.only(left: 23),
            child: Text(
              "How to Prepare",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: Constans.fontFamily,
                  color: Color(0xff274c78),
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 33, bottom: 25),
            child: SingleChildScrollView(
              child: Text(
                widget.meal.preparation!,
                // maxLines: 35,
                // overflow: TextOverflow.ellipsis,
                // softWrap: true,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: "Lora",
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopWidgetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset controllPoint1 = Offset(0, size.height - 65);
    Offset endPoint1 = Offset(100, size.height - 65);
    Offset controllPoint2 = Offset(size.width, size.height - 60);
    Offset endPoint2 = Offset(size.width, size.height - 130);
    Path path = Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
          controllPoint1.dx, controllPoint1.dy, endPoint1.dx, endPoint1.dy)
      ..lineTo(size.width - 70, size.height - 70)
      ..quadraticBezierTo(
          controllPoint2.dx, controllPoint2.dy, endPoint2.dx, endPoint2.dy)
      ..lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
