import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/favorites_controller.dart';
import 'package:fitnessapp/controller/search_controller.dart';
import 'package:fitnessapp/models/meal.dart';
import 'package:fitnessapp/views/food/meal_page.dart';
import 'package:fitnessapp/views/food/widgets/meal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController? textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(children: [
          Stack(children: [
            Form(
              autovalidateMode: AutovalidateMode.always,
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
                child: SizedBox(
                  width: 320,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    elevation: 5,
                    color: Colors.white,
                    child: TextFormField(
                      controller: textController,
                      clipBehavior: Clip.antiAlias,
                      onChanged: (value) {
                        setState(() {
                          String searchQuery =
                              value.isNotEmpty ? value : "default";
                          ControllerSearch().postSearch(
                              mealName: searchQuery, start: '1', limit: '10');
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return null;
                        }
                        if (value.length > 16) {
                          return "Meal Must be less than 16 Characters";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Search...",
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontFamily: Constans.fontFamily),
                        contentPadding: const EdgeInsets.only(left: 15),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 0.3),
                            borderRadius: BorderRadius.circular(24)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black26),
                            borderRadius: BorderRadius.circular(24)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 300,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                child: const CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 24,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            )
          ]),
          textController!.text.isNotEmpty
              ? FutureBuilder<List<Meal>?>(
                  future: ControllerSearch().postSearch(
                      mealName: textController!.text,
                      start: 1.toString(),
                      limit: 10.toString()),
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
                      List<Meal> searchlist = snapshot.data!;
                      return searchlist.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 7, right: 5, top: 10),
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
                                    childCount: searchlist.length,
                                    (context, index) => MealCard(
                                        onTap: () {
                                          Get.to(
                                            () => MealPage(
                                              meal: searchlist[index],
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
                                                      if (searchlist[index]
                                                              .isfavorite ==
                                                          false) {
                                                        cardController1
                                                            .addToFavorites(
                                                                searchlist[
                                                                        index]
                                                                    .id)
                                                            .then((value) {
                                                          searchlist[index]
                                                                  .isfavorite =
                                                              true;
                                                          cardController1
                                                              .update();
                                                        });
                                                      } else {
                                                        cardController1
                                                            .removeFavorites(
                                                                searchlist[
                                                                        index]
                                                                    .id)
                                                            .then((value) {
                                                          searchlist[index]
                                                                  .isfavorite =
                                                              false;
                                                          cardController1
                                                              .update();
                                                        });
                                                      }
                                                    },
                                                    icon: Icon(
                                                      searchlist[index]
                                                                  .isfavorite ==
                                                              true
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_border,
                                                      size: 32,
                                                      color: searchlist[index]
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
                                        id: searchlist[index].id,
                                        isfavorite:
                                            searchlist[index].isfavorite,
                                        image: searchlist[index].image,
                                        text: searchlist[index].name,
                                        cal: searchlist[index].calories,
                                        protien: searchlist[index].protein,
                                        warning: searchlist[index].warning !=
                                                null
                                            ? searchlist[index].warning == ""
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
                          : Center(
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 70),
                                    child: Image.asset(
                                      "assets/images/waiting1.jpg",
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 60),
                                    child: const Text(
                                      "No results found",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: "Lora",
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
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
              : Column(children: [
                  Container(
                    padding: const EdgeInsets.only(top: 70),
                    height: 350,
                    width: 350,
                    child: Image.asset(
                      "assets/images/controller textfield.jpg",
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: const Text(
                      "Search for what you want",
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: "Lora",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ]),
        ]));
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
