import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/food/widgets/meal_card.dart';
import 'package:fitnessapp/views/media/Widgets/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MediaProfile extends StatefulWidget {
  const MediaProfile({super.key});

  @override
  State<MediaProfile> createState() => _MediaProfileState();
}

class _MediaProfileState extends State<MediaProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constans.screen,
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {
      //       Get.back();
      //     },
      //     icon: const Icon(
      //       Icons.arrow_back_ios_new,
      //       size: 25,
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
      body: ListView(
        children: [
          Stack(clipBehavior: Clip.none, children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Constans.screen,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(48),
                    bottomRight: Radius.circular(45)),
              ),
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              child: Opacity(
                opacity: 0.9,
                child: Image.asset(
                  "assets/images/photomee.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            ),
            // const Positioned(
            //   left: 140,
            //   top: 5,
            //   child: Text(
            //     "My Profile",
            //     style: TextStyle(
            //       fontSize: 25,
            //       fontFamily: Constans.fontFamily,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            // Positioned(
            //     left: 40,
            //     top: 340,
            //     child: Container(
            //       decoration: BoxDecoration(
            //         color: Colors.white.withOpacity(0.4),
            //         borderRadius: BorderRadius.all(Radius.circular(15)),
            //       ),
            //       height: MediaQuery.of(context).size.height * 0.4,
            //       width: MediaQuery.of(context).size.width * 0.81,
            //       child: Center(
            //         child: Text(
            //           "Sedra Nadr",
            //           style: TextStyle(
            //             fontSize: 25,
            //             fontFamily: Constans.fontFamily,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black,
            //           ),
            //         ),
            //       ),
            //     ))
          ]),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15, top: 10),
                  child: Text(
                    "Sedra Nadr",
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: Constans.fontFamily,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 15),
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Text(
                      "Believe in yourself! Have faith in your abilities! Without a humble but reasonable confidence in your own powers you cannot be successful or happy.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Lora",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GridView.custom(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverWovenGridDelegate.count(
              crossAxisCount: 3,
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
                childCount: 10,
                (context, index) => Image.asset("assets/images/photomee.jpg")),
          ),
        ],
      ),
    );
  }
}
