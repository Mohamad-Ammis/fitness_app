import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/favorites_controller.dart';
import 'package:fitnessapp/controller/popularmeals_controller.dart';
import 'package:fitnessapp/models/meal.dart';
import 'package:fitnessapp/views/food/meal_page.dart';
import 'package:fitnessapp/views/food/widgets/meal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import 'package:shimmer/shimmer.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  ControllerPopular conFav = Get.put(ControllerPopular(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constans.screen,
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 25,
                color: Colors.black,
              ),
            ),
            elevation: 0,
            backgroundColor: Constans.screen,
            title: const Padding(
              padding: EdgeInsets.only(left: 70),
              child: Text(
                "Favorite",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: Constans.fontFamily,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            )),
        body: GetBuilder<ControllerFavorite>(
          builder: (controller) {
            return FutureBuilder<List<Meal>?>(
                future: ControllerFavorite().getFavoriteMeals(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return getShimmerAllMeal();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.data == null) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 250, left: 30, right: 20),
                      child: Text(
                        'No Internet,Please try again',
                        style: TextStyle(
                            fontFamily: "Lora",
                            fontSize: 25,
                            color: Colors.black),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    List<Meal> favoriteList = snapshot.data!;
                    return favoriteList.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(left: 7, right: 5),
                            child: GridView.custom(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: SliverWovenGridDelegate.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 0.2,
                                crossAxisSpacing: 0.5,
                                pattern: [
                                  const WovenGridTile(0.78),
                                  const WovenGridTile(
                                    0.68,
                                    crossAxisRatio: 0.98,
                                    alignment: AlignmentDirectional.centerEnd,
                                  ),
                                ],
                              ),
                              childrenDelegate: SliverChildBuilderDelegate(
                                  childCount: favoriteList.length,
                                  (context, index) => MealCard(
                                      onTap: () {
                                        Get.to(
                                          () => MealPage(
                                            meal: favoriteList[index],
                                          ),
                                        );
                                      },
                                      widg: GetBuilder<ControllerFavorite>(
                                        builder: (cardController1) {
                                          return Positioned(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            child: CircleAvatar(
                                                backgroundColor: Colors.white
                                                    .withOpacity(0.4),
                                                radius: 18,
                                                child: IconButton(
                                                  onPressed: () {
                                                    if (favoriteList[index]
                                                            .isfavorite ==
                                                        false) {
                                                      cardController1
                                                          .addToFavorites(
                                                              favoriteList[
                                                                      index]
                                                                  .id)
                                                          .then((value) {
                                                        favoriteList[index]
                                                            .isfavorite = true;
                                                        cardController1
                                                            .update();
                                                      });
                                                    } else {
                                                      cardController1
                                                          .removeFavorites(
                                                              favoriteList[
                                                                      index]
                                                                  .id)
                                                          .then((value) {
                                                        favoriteList[index]
                                                            .isfavorite = false;
                                                        conFav.getPopularMeal();

                                                        cardController1
                                                            .update();
                                                      });
                                                    }
                                                  },
                                                  icon: Icon(
                                                    favoriteList[index]
                                                                .isfavorite ==
                                                            true
                                                        ? Icons.favorite
                                                        : Icons.favorite_border,
                                                    size: 32,
                                                    color: favoriteList[index]
                                                                .isfavorite ==
                                                            true
                                                        ? Colors.red
                                                        : Colors.white,
                                                  ),
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0),
                                                )),
                                          );
                                        },
                                      ),
                                      image: favoriteList[index].image,
                                      isfavorite:
                                          favoriteList[index].isfavorite,
                                      id: favoriteList[index].id,
                                      text: favoriteList[index].name,
                                      cal: favoriteList[index].calories,
                                      protien: favoriteList[index].protein,
                                      warning: favoriteList[index].warning !=
                                              null
                                          ? favoriteList[index].warning == ""
                                              ? Container()
                                              : Icon(
                                                  Icons.warning_rounded,
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                  size: 37,
                                                )
                                          : Container())),
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.only(top: 300, left: 35),
                            child: const Text(
                              "Your favorites list is empty",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "Lora",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.only(top: 250, left: 30, right: 20),
                      child: Text(
                        'No Internet,Please try again',
                        style: TextStyle(
                            fontFamily: "Lora",
                            fontSize: 25,
                            color: Colors.black),
                      ),
                    );
                  }
                });
          },
        ));
  }

  Shimmer getShimmerAllMeal() {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
            padding: const EdgeInsets.only(left: 7, right: 5),
            child: GridView.custom(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverWovenGridDelegate.count(
                crossAxisCount: 2,
                mainAxisSpacing: 0.2,
                crossAxisSpacing: 0.5,
                pattern: [
                  const WovenGridTile(0.78),
                  const WovenGridTile(
                    0.68,
                    crossAxisRatio: 0.98,
                    alignment: AlignmentDirectional.centerEnd,
                  ),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                childCount: 8,
                (context, index) => Card(
                    elevation: 18,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      color: Colors.red,
                    )),
              ),
            )));
  }
}
