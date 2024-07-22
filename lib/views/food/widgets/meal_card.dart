import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/favorites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RecentlyCard extends StatefulWidget {
  RecentlyCard({
    super.key,
    required this.image,
    required this.text,
    required this.cal,
    required this.protien,
    required this.warning,
    this.onTap,
    this.id,
    this.widg,
    this.isfavorite,
  });
  String? image;
  String? text;
  Widget? warning;
  Widget? widg;
  int? id;
  bool? isfavorite;
  dynamic cal;
  dynamic protien;
  void Function()? onTap;

  @override
  State<RecentlyCard> createState() => _RecentlyCardState();
}

class _RecentlyCardState extends State<RecentlyCard> {
  ControllerFavorite cardController2 =
      Get.put(ControllerFavorite(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 5),
      child: LayoutBuilder(builder: (context, cont) {
        return InkWell(
          onTap: widget.onTap,
          child: Card(
            clipBehavior: Clip.antiAlias,
            shadowColor: Colors.black,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: Stack(children: [
              CachedNetworkImage(
                imageUrl:
                    "http://${Constans.host}:8000/uploads/${widget.image}",
                height: cont.maxHeight,
                width: 290,
                fit: BoxFit.cover,
              ),
              Positioned(
                  top: cont.maxHeight - 87,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    height: 80,
                    width: 290,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            widget.text!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: const TextStyle(
                                fontSize: 23,
                                fontFamily: Constans.fontFamily,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.local_fire_department_rounded,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "${widget.cal!}cal",
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontFamily: Constans.fontFamily,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/muscle.png"),
                                      color: Colors.white,
                                      height: 17,
                                      width: 17,
                                    ),
                                  ),
                                  Text(
                                    "${widget.protien!}g",
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontFamily: Constans.fontFamily,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              Positioned(top: 10, right: 235, child: widget.warning!),
              widget.widg!
            ]),
          ),
        );
      }),
    );
  }
}

// ignore: must_be_immutable
class MealCard extends StatefulWidget {
  MealCard(
      {super.key,
      required this.image,
      required this.text,
      required this.cal,
      required this.warning,
      required this.onTap,
      required this.protien,
      this.id,
      this.widg,
      this.isfavorite});
  String? image;
  String? text;
  dynamic cal;
  Widget? warning;
  Widget? widg;
  dynamic protien;
  void Function()? onTap;
  int? id;
  bool? isfavorite;

  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, cont) => InkWell(
        onTap: widget.onTap!,
        child: Card(
          elevation: 18,
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Stack(children: [
            CachedNetworkImage(
              imageUrl: "http://${Constans.host}:8000/uploads/${widget.image}",
              height: cont.maxHeight,
              width: cont.maxWidth,
              fit: BoxFit.cover,
            ),
            Positioned(
                top: cont.maxHeight - 68,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  height: cont.maxHeight * 0.25,
                  width: cont.maxWidth,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6, right: 4),
                        child: Text(
                          widget.text!,
                          style: const TextStyle(
                              fontSize: 18,
                              fontFamily: Constans.fontFamily,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6, right: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.local_fire_department_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Text(
                                  "${widget.cal!}cal",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: Constans.fontFamily,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Image(
                                    image:
                                        AssetImage("assets/images/muscle.png"),
                                    color: Colors.white,
                                    height: 15,
                                    width: 15,
                                  ),
                                ),
                                Text(
                                  "${widget.protien!}g",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: Constans.fontFamily,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),

            // Positioned(
            //     top: cont.maxHeight * 0.03,
            //     left: cont.maxWidth * 0.69,
            //     child: widget.fav!),
            Positioned(
              top: cont.maxHeight * 0.03,
              right: cont.maxWidth * 0.72,
              child: widget.warning!,
            ),
            widget.widg!,
          ]),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PopularCard extends StatefulWidget {
  PopularCard({
    super.key,
    required this.image,
    required this.text,
    required this.cal,
    required this.warning,
    required this.protien,
    this.onTap,
    this.widg,
  });
  String? image;
  String? text;
  Widget? warning;
  Widget? widg;

  dynamic cal;
  dynamic protien;
  void Function()? onTap;

  @override
  State<PopularCard> createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, cont) => InkWell(
              onTap: widget.onTap,
              child: Card(
                  margin:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                  elevation: 6,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9)),
                  child: Stack(clipBehavior: Clip.none, children: [
                    CachedNetworkImage(
                      imageUrl:
                          "http://${Constans.host}:8000/uploads/${widget.image}",
                      height: cont.maxHeight,
                      width: cont.maxWidth,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        top: cont.maxHeight * 0.7,
                        left: cont.maxHeight * 0.00009,
                        right: cont.maxHeight * 0.00009,
                        child: Container(
                          //padding: const EdgeInsets.only(left: 10, right: 10),
                          decoration: const BoxDecoration(
                              color: Color(0xfff3f4f6),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          height: cont.maxHeight * 0.31,
                          width: cont.maxWidth,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 6, right: 4, left: 13),
                                child: Text(
                                  widget.text!,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontFamily: Constans.fontFamily,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 9, left: 12),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.local_fire_department_rounded,
                                          color: Colors.black45,
                                          size: 25,
                                        ),
                                        Text(
                                          "${widget.cal!}cal",
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontFamily: Constans.fontFamily,
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Image(
                                            image: AssetImage(
                                                "assets/images/muscle.png"),
                                            color: Colors.black45,
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                        Text(
                                          "${widget.protien!}g",
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontFamily: Constans.fontFamily,
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                    // Positioned(
                    //     top: cont.maxHeight * 0.03,
                    //     left: cont.maxWidth * 0.79,
                    //     child: widget.fav!),
                    Positioned(
                        top: cont.maxHeight * 0.03,
                        right: cont.maxWidth * 0.79,
                        child: widget.warning!),
                    widget.widg!
                  ])),
            ));
  }
}
