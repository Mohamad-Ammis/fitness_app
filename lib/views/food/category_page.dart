// ignore: must_be_immutable
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/category_controller.dart';
import 'package:fitnessapp/controller/favorites_controller.dart';
import 'package:fitnessapp/models/meal.dart';
import 'package:fitnessapp/views/food/meal_page.dart';
import 'package:fitnessapp/views/food/widgets/meal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class CategoryPage extends StatefulWidget {
  CategoryPage({super.key, this.title, this.categoryName});
  String? title;
  String? categoryName;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  ControllerCategory mealCont = Get.put(ControllerCategory(), permanent: true);
  Future<List<Meal>?>? allMealsFuture;
  Future<List<Meal>?>? sugarMealsFuture;
  Future<List<Meal>?>? vegMealsFuture;

  int current = 0;

  @override
  void initState() {
    super.initState();

    allMealsFuture =
        ControllerCategory().postCategory(categoryName: widget.categoryName!);
    sugarMealsFuture = ControllerCategory()
        .postType(categoryName: widget.categoryName!, type: "sugar free");
    vegMealsFuture = ControllerCategory()
        .postType(categoryName: widget.categoryName!, type: "vegetarian");
  }

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
        backgroundColor: Constans.screen,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Text(
            widget.title!,
            style: const TextStyle(
                fontSize: 25,
                fontFamily: Constans.fontFamily,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildRowCategory(
                    0, MediaQuery.of(context).size.width * 0.18, "All"),
                buildRowCategory(
                    1, MediaQuery.of(context).size.width * 0.32, "Suger Free"),
                buildRowCategory(
                    2, MediaQuery.of(context).size.width * 0.34, "Vegeterian")
              ],
            ),
          ),
          current == 0
              ? FutureBuilder<List<Meal>?>(
                  future: allMealsFuture,
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
                      List<Meal> categorylist = snapshot.data!;
                      return categorylist.isNotEmpty
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
                                    childCount: categorylist.length,
                                    (context, index) => MealCard(
                                        onTap: () {
                                          mealCont.getMealId(
                                              categorylist[index].id);
                                          Get.to(
                                            () => MealPage(
                                              meal: categorylist[index],
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
                                                      if (categorylist[index]
                                                              .isfavorite ==
                                                          false) {
                                                        cardController1
                                                            .addToFavorites(
                                                                categorylist[
                                                                        index]
                                                                    .id!)
                                                            .then((value) {
                                                          categorylist[index]
                                                                  .isfavorite =
                                                              true;
                                                          cardController1
                                                              .update();
                                                        });
                                                      } else {
                                                        cardController1
                                                            .removeFavorites(
                                                                categorylist[
                                                                        index]
                                                                    .id!)
                                                            .then((value) {
                                                          categorylist[index]
                                                                  .isfavorite =
                                                              false;
                                                          cardController1
                                                              .update();
                                                        });
                                                      }
                                                    },
                                                    icon: Icon(
                                                      categorylist[index]
                                                                  .isfavorite ==
                                                              true
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_border,
                                                      size: 32,
                                                      color: categorylist[index]
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
                                        isfavorite:
                                            categorylist[index].isfavorite,
                                        id: categorylist[index].id,
                                        image: categorylist[index].image,
                                        text: categorylist[index].name,
                                        cal: categorylist[index].calories,
                                        protien: categorylist[index].protein,
                                        warning:
                                            categorylist[index].warning != null
                                                ? Icon(
                                                    Icons.warning_rounded,
                                                    color: Colors.white
                                                        .withOpacity(0.8),
                                                    size: 37,
                                                  )
                                                : Container())),
                              ),
                            )
                          : Center(
                              child: Container(
                                padding:
                                    const EdgeInsets.only(top: 300, bottom: 50),
                                child: const Text(
                                  "There are no meals for this type",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: "Lora",
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
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
                  })
              : Container(),
          current == 1
              ? FutureBuilder<List<Meal>?>(
                  future: sugarMealsFuture,
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
                      List<Meal> typeList = snapshot.data!;
                      return typeList.isNotEmpty
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
                                    childCount: typeList.length,
                                    (context, index) => MealCard(
                                        onTap: () {
                                          mealCont
                                              .getMealId(typeList[index].id);
                                          Get.to(
                                            () => MealPage(
                                              meal: typeList[index],
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
                                                      if (typeList[index]
                                                              .isfavorite ==
                                                          false) {
                                                        cardController1
                                                            .addToFavorites(
                                                                typeList[index]
                                                                    .id!)
                                                            .then((value) {
                                                          typeList[index]
                                                                  .isfavorite =
                                                              true;
                                                          cardController1
                                                              .update();
                                                        });
                                                      } else {
                                                        cardController1
                                                            .removeFavorites(
                                                                typeList[index]
                                                                    .id!)
                                                            .then((value) {
                                                          typeList[index]
                                                                  .isfavorite =
                                                              false;
                                                          cardController1
                                                              .update();
                                                        });
                                                      }
                                                    },
                                                    icon: Icon(
                                                      typeList[index]
                                                                  .isfavorite ==
                                                              true
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_border,
                                                      size: 32,
                                                      color: typeList[index]
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
                                        isfavorite: typeList[index].isfavorite,
                                        id: typeList[index].id!,
                                        image: typeList[index].image,
                                        text: typeList[index].name,
                                        cal: typeList[index].calories,
                                        protien: typeList[index].protein,
                                        warning: typeList[index].warning != null
                                            ? Icon(
                                                Icons.warning_rounded,
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                size: 35,
                                              )
                                            : Container())),
                              ),
                            )
                          : Center(
                              child: Container(
                                padding:
                                    const EdgeInsets.only(top: 300, bottom: 50),
                                child: const Text(
                                  "There are no meals for this type",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: "Lora",
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
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
                  })
              : Container(),
          current == 2
              ? FutureBuilder<List<Meal>?>(
                  future: vegMealsFuture,
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
                      List<Meal> typeList = snapshot.data!;
                      return typeList.isNotEmpty
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
                                    childCount: typeList.length,
                                    (context, index) => MealCard(
                                        onTap: () {
                                          mealCont
                                              .getMealId(typeList[index].id);
                                          Get.to(
                                            () => MealPage(
                                              meal: typeList[index],
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
                                                      if (typeList[index]
                                                              .isfavorite ==
                                                          false) {
                                                        cardController1
                                                            .addToFavorites(
                                                                typeList[index]
                                                                    .id!)
                                                            .then((value) {
                                                          typeList[index]
                                                                  .isfavorite =
                                                              true;
                                                          cardController1
                                                              .update();
                                                        });
                                                      } else {
                                                        cardController1
                                                            .removeFavorites(
                                                                typeList[index]
                                                                    .id!)
                                                            .then((value) {
                                                          typeList[index]
                                                                  .isfavorite =
                                                              false;
                                                          cardController1
                                                              .update();
                                                        });
                                                      }
                                                    },
                                                    icon: Icon(
                                                      typeList[index]
                                                                  .isfavorite ==
                                                              true
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_border,
                                                      size: 32,
                                                      color: typeList[index]
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
                                        id: typeList[index].id!,
                                        isfavorite: typeList[index].isfavorite,
                                        image: typeList[index].image,
                                        text: typeList[index].name,
                                        cal: typeList[index].calories,
                                        protien: typeList[index].protein,
                                        warning: typeList[index].warning != null
                                            ? Icon(
                                                Icons.warning_rounded,
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                size: 35,
                                              )
                                            : Center(
                                                child: Container(),
                                              ))),
                              ),
                            )
                          : Center(
                              child: Container(
                                padding:
                                    const EdgeInsets.only(top: 300, bottom: 50),
                                child: const Text(
                                  "There are no meals for this type",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: "Lora",
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
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
                  })
              : Container(),
        ],
      ),
    );
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

  Column buildRowCategory(index, width, text) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                current = index;
              });
            },
            style: OutlinedButton.styleFrom(
              backgroundColor:
                  current == index ? Constans.foodblue : Colors.white,
              side: const BorderSide(
                color: Constans.foodblue,
              ),
              fixedSize: Size(width, 30),
              shape: const StadiumBorder(),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: Constans.fontFamily,
                  fontWeight: FontWeight.bold,
                  color: current == index ? Colors.white : Constans.foodblue,
                ),
              ),
            ),
          )),
      Visibility(
          visible: current == index,
          child: Container(
            height: 5,
            width: 5,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Constans.foodblue,
            ),
          ))
    ]);
  }
}
