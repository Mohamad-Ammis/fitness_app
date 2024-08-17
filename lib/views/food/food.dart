import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/favorites_controller.dart';
import 'package:fitnessapp/controller/popularmeals_controller.dart';
import 'package:fitnessapp/controller/recenlymeals_controller.dart';
import 'package:fitnessapp/models/meal.dart';
import 'package:fitnessapp/views/food/category_page.dart';
import 'package:fitnessapp/views/food/favorites_page.dart';
import 'package:fitnessapp/views/food/meal_page.dart';
import 'package:fitnessapp/views/food/search_page.dart';
import 'package:fitnessapp/views/food/widgets/category.dart';
import 'package:fitnessapp/views/food/widgets/meal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  ControllerFavorite cardController =
      Get.put(ControllerFavorite(), permanent: true);
  ControllerFavorite cardController2 =
      Get.put(ControllerFavorite(), permanent: true);
  int current = 0;

  bool isloading = false;
  Future<List<Meal>?>? recentlyMealsFuture;
  Future<List<Meal>?>? popularMealsFuture;

  @override
  void initState() {
    super.initState();

    recentlyMealsFuture = ControllerRecently().getRecentlyMeal();

    popularMealsFuture = ControllerPopular().getPopularMeal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constans.screen,
      appBar: AppBar(
        backgroundColor: Constans.screen,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const FavoritePage());
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.black,
                size: 30,
              )),
        ],
        leading: Row(
          children: [
            InkWell(
              onTap: () => ZoomDrawer.of(context)!.toggle(),
              child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  height: MediaQuery.of(context).size.height * 0.11,
                  width: MediaQuery.of(context).size.width * 0.11,
                  child: Image.asset(
                    "assets/images/apps.png",
                    fit: BoxFit.contain,
                  )),
            ),
          ],
        ),
        title: const Padding(
          padding: EdgeInsets.only(right: 50, left: 0),
          child: Text(
            "Food",
            style: TextStyle(
                fontSize: 38,
                fontFamily: Constans.fontFamily,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        // title: Row(
        //   children: [

        //     // InkWell(
        //     //   onTap: () {
        //     //     () => ZoomDrawer.of(context)!.toggle();
        //     //   },
        //     //   child: const Image(
        //     //     image: AssetImage("assets/images/categoryicon.jpg"),
        //     //     height: 22,
        //     //     width: 22,
        //     //   ),
        //     // ),

        //   ],
        // ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 15),
          child: Container(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Lora",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: const <TextSpan>[
                  TextSpan(text: "Balance Healthy Eating, with Plenty of "),
                  TextSpan(
                    text: "Physical Exercise",
                    style: TextStyle(color: Constans.foodblue),
                  ),
                ],
              ),
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // child: Stack(clipBehavior: Clip.none, children: [
          //   const Text(
          //     "Balance Healthy Eating, with Plenty of  ",
          //     maxLines: 2,
          //     softWrap: true,
          //     overflow: TextOverflow.ellipsis,
          //     style: TextStyle(
          //         fontSize: 25,
          //         fontFamily: "Lora",
          //         color: Colors.black,
          //         fontWeight: FontWeight.bold),
          //   ),
          //   Positioned(
          //     top: MediaQuery.of(context).size.height * 0.055, //36,
          //     left: MediaQuery.of(context).size.width * 0.3,
          //     child: const Text(
          //       "Physical Exercise ",
          //       style: TextStyle(
          //           fontSize: 25,
          //           fontFamily: "Lora",
          //           color: Constans.foodblue,
          //           fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: InkWell(
            onTap: () {
              Get.to(() => const SearchPage());
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              clipBehavior: Clip.antiAlias,
              child: const ListTile(
                leading: Icon(
                  Icons.search_outlined,
                  color: Colors.black,
                ),
                title: Text("Search"),
                trailing: Icon(
                  Icons.notes,
                  color: Colors.black,
                ),
                tileColor: Colors.white,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15, left: 10, bottom: 10),
          child: Row(
            children: [
              Text(
                "Popular Recipes",
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: Constans.fontFamily,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 6,
              ),
              Icon(
                FontAwesomeIcons.rankingStar,
                // Icons.trending_up_outlined,
                color: Colors.black,
                size: 18,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: FutureBuilder<List<Meal>?>(
              future: popularMealsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return getShimmerPopular();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.data == null) {
                  return getShimmerPopular();
                } else if (snapshot.hasData) {
                  List<Meal> popularList = snapshot.data!;
                  return CarouselSlider.builder(
                      itemCount: popularList.length,
                      itemBuilder: (context, index, realIdx) {
                        return PopularCard(
                          onTap: () {
                            Get.to(() => MealPage(meal: popularList[index]));
                          },
                          widg: GetBuilder<ControllerFavorite>(
                            builder: (cardController) {
                              return Positioned(
                                top: MediaQuery.of(context).size.height * 0.01,
                                left: MediaQuery.of(context).size.width * 0.77,
                                child: CircleAvatar(
                                    backgroundColor:
                                        Colors.white.withOpacity(0.5),
                                    radius: 20,
                                    child: IconButton(
                                      onPressed: () {
                                        if (popularList[index].isfavorite ==
                                            false) {
                                          cardController
                                              .addToFavorites(
                                                  popularList[index].id)
                                              .then((value) {
                                            popularList[index].isfavorite =
                                                true;
                                            cardController.update();
                                          });
                                        } else {
                                          cardController
                                              .removeFavorites(
                                                  popularList[index].id)
                                              .then((value) {
                                            popularList[index].isfavorite =
                                                false;
                                            cardController.update();
                                          });
                                        }
                                      },
                                      icon: Icon(
                                        popularList[index].isfavorite == true
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        size: 32,
                                        color: popularList[index].isfavorite ==
                                                true
                                            ? Colors.red
                                            : Colors.white,
                                      ),
                                      padding: const EdgeInsets.only(left: 0),
                                    )),
                              );
                            },
                          ),
                          image: popularList[index].image,
                          text: popularList[index].name,
                          cal: popularList[index].calories,
                          protien: popularList[index].protein,
                          warning: popularList[index].warning != null
                              ? popularList[index].warning == ""
                                  ? Container()
                                  : Icon(
                                      Icons.warning_rounded,
                                      color: Colors.white.withOpacity(0.8),
                                      size: 40,
                                    )
                              : Container(),
                        );
                      },
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            current = index;
                          });
                        },
                        height: MediaQuery.of(context).size.height * 0.36,
                        viewportFraction: 0.99,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 8),
                      ));
                } else {
                  return getShimmerPopular();
                  // return const Text(
                  //   ' ',
                  //   style: TextStyle(
                  //       fontFamily: "Lora", fontSize: 25, color: Colors.black),
                  // );
                }
              }),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildContainer(0),
            buildContainer(1),
            buildContainer(2),
            buildContainer(3),
            buildContainer(4)
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 10, bottom: 10),
          child: Row(
            children: [
              Text(
                "Top Categories",
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: Constans.fontFamily,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.star_purple500_rounded,
                color: Colors.black,
              )
            ],
          ),
        ),
        SizedBox(
          height: 140,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            MainCategory(
              text: "Breakfast",
              icon: FontAwesomeIcons.mugSaucer,
              size: 30,
              left: 18,
              top: 30,
              onTap: () {
                Get.to(() => CategoryPage(
                      title: "Breakfast",
                      categoryName: "breakfast",
                    ));
              },
            ),
            MainCategory(
              text: "Lunch",
              size: 40,
              left: 16,
              top: 25,
              icon: Icons.ramen_dining_rounded,
              onTap: () {
                Get.to(() => CategoryPage(
                      title: "Lunch",
                      categoryName: "lunch",
                    ));
              },
            ),
            MainCategory(
              text: "Dinner",
              size: 35,
              left: 18,
              top: 25,
              icon: FontAwesomeIcons.bowlFood,
              onTap: () {
                Get.to(() => CategoryPage(
                      title: "Dinner",
                      categoryName: "dinner",
                    ));
              },
            ),
            MainCategory(
              text: "Snack",
              size: 35,
              left: 18,
              top: 25,
              icon: FontAwesomeIcons.appleWhole,
              onTap: () {
                Get.to(() => CategoryPage(
                      title: "Snack",
                      categoryName: "snack",
                    ));
              },
            ),
          ]),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 10),
          child: Row(
            children: [
              Text(
                "Recently Added",
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: Constans.fontFamily,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.update,
                color: Colors.black,
              )
            ],
          ),
        ),
        FutureBuilder<List<Meal>?>(
            future: recentlyMealsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return getShimmerRecently();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.data == null) {
                return getShimmerRecently();
              } else if (snapshot.hasData) {
                List<Meal> recentlyList = snapshot.data!;
                return SizedBox(
                  height: 290,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recentlyList.length,
                      itemBuilder: (context, index) {
                        return RecentlyCard(
                          onTap: () {
                            Get.to(() => MealPage(
                                  meal: recentlyList[index],
                                ));
                          },
                          widg: GetBuilder<ControllerFavorite>(
                              builder: (cardController2) {
                            return Positioned(
                                top: MediaQuery.of(context).size.height * 0.01,
                                left: MediaQuery.of(context).size.width * 0.59,
                                child: CircleAvatar(
                                    backgroundColor:
                                        Colors.white.withOpacity(0.4),
                                    radius: 20,
                                    child: IconButton(
                                      onPressed: () {
                                        if (recentlyList[index].isfavorite ==
                                            false) {
                                          cardController2
                                              .addToFavorites(
                                            recentlyList[index].id,
                                          )
                                              .then((value) {
                                            recentlyList[index].isfavorite =
                                                true;
                                            cardController2.update();
                                          });
                                        } else {
                                          cardController2
                                              .removeFavorites(
                                            recentlyList[index].id,
                                          )
                                              .then((value) {
                                            recentlyList[index].isfavorite =
                                                false;
                                            cardController2.update();
                                          });
                                        }
                                      },
                                      icon: Icon(
                                        recentlyList[index].isfavorite == true
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        size: 32,
                                        color: recentlyList[index].isfavorite ==
                                                true
                                            ? Colors.red
                                            : Colors.white,
                                      ),
                                      padding: const EdgeInsets.only(left: 0),
                                    )));
                          }),
                          id: recentlyList[index].id,
                          isfavorite: recentlyList[index].isfavorite,
                          image: recentlyList[index].image,
                          text: recentlyList[index].name,
                          cal: recentlyList[index].calories,
                          protien: recentlyList[index].protein,
                          warning: recentlyList[index].warning != null
                              ? recentlyList[index].warning == ""
                                  ? Container()
                                  : Icon(
                                      Icons.warning_rounded,
                                      color: Colors.white.withOpacity(0.8),
                                      size: 39,
                                    )
                              : Container(),
                        );
                      }),
                );
              } else {
                return getShimmerRecently();
                // return const Text(
                //   ' ',
                //   style: TextStyle(
                //       fontFamily: "Lora", fontSize: 25, color: Colors.black),
                // );
              }
            })
      ]),
    );
  }

  Container buildContainer(index) {
    return Container(
        height: 10,
        width: 10,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: current == index ? Colors.black : Colors.grey));
  }

  Shimmer getShimmerPopular() {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Card(
          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          elevation: 6,
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Container(
            height: 280,
            width: MediaQuery.of(context).size.width * 0.81,
            color: Colors.white,
          ),
        ));
  }

  Shimmer getShimmerRecently() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        height: 290,
        child: ListView.builder(
            padding: const EdgeInsets.only(top: 7),
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                elevation: 4,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                child: Container(
                  height: 280,
                  width: 290,
                  color: Colors.white,
                ),
              );
            }),
      ),
    );
  }
}
