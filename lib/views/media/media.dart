import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/media/contra.dart';
import 'package:fitnessapp/views/media/Widgets/post.dart';
import 'package:fitnessapp/views/media/media_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class Media extends StatelessWidget {
  const Media({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constans.screen,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Constans.screen,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 3),
            child: GestureDetector(
              onTap: () {
                Get.to(const MediaProfile());
              },
              child: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/mee.jpg")),
              ),
            ),
          ),
        ],
        title: Row(
          children: [
            InkWell(
              onTap: () => ZoomDrawer.of(context)!.toggle(),
              child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.11,
                  child: Image.asset(
                    "assets/images/apps.png",
                    fit: BoxFit.contain,
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 70, left: 15),
              child: Text(
                "Media",
                style: TextStyle(
                    fontSize: 33,
                    fontFamily: Constans.fontFamily,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: ListView(children: [
        InkWell(
          onTap: () {
            Get.to(const Contra());
          },
          child: Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 15, right: 10, bottom: 7),
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffcfdef3)),
                  gradient: const LinearGradient(colors: [
                    Color(0xffe0eaf3),
                    Color(0xffcfdef3),
                    Color(0xffdae2f8)
                  ]),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 15,
                ),
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.98,
                child: const Text(
                  "What's on your mind...?",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontFamily: Constans.fontFamily),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.009,
                left: MediaQuery.of(context).size.width * 0.7,
                child: Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.only(left: 2, right: 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Image(
                      image: AssetImage("assets/images/gallery.png"),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.009,
                left: MediaQuery.of(context).size.width * 0.81,
                child: Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.only(left: 2, right: 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Image(
                      image: AssetImage("assets/images/video (1).png"),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
        // const Padding(
        //   padding: EdgeInsets.only(top: 10, left: 15, bottom: 9),
        //   child: Text(
        //     "Explore",
        //     style: TextStyle(
        //         fontSize: 26,
        //         fontFamily: Constans.fontFamily,
        //         color: Colors.black,
        //         fontWeight: FontWeight.bold),
        //   ),
        // ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 1,
          itemBuilder: (context, index) {
            return PostWidget(
                text: "Work smarter, not harder When I let go of what I am");
          },
        ),
        PostWidget(
            image: "assets/images/photomee.jpg",
            text: "Work smarter, not harder When I let go of what I am"),
        PostWidget(image: "assets/images/mee.jpg"),
        PostWidget(
            text:
                "Believe in yourself! Have faith in your abilities! Without a humble but reasonable confidence in your own powers you cannot be successful or happy."),
      ]),
    );
  }
}
