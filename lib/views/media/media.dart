import 'dart:convert';

import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/add_post_controller.dart';
import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/models/post_model.dart';
import 'package:fitnessapp/shimmer/shimmergym.dart';
import 'package:fitnessapp/views/media/Widgets/addpost_widget.dart';
import 'package:fitnessapp/views/media/Widgets/post.dart';
import 'package:fitnessapp/views/media/media_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class Media extends StatefulWidget {
  const Media({super.key});

  @override
  State<Media> createState() => _MediaState();
}

class _MediaState extends State<Media> {
  ControllerAddPost con = Get.put(ControllerAddPost(), permanent: true);
  Datacontroller conImage = Get.put(Datacontroller(), permanent: true);
  String? userIdShared = userInfo?.getString('id');
  String? usernameShared = userInfo?.getString('name');

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!con.textFieldFocusNode.hasFocus) {
      con.postsFuture = con.getAllPosts();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constans.screen,
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 3, bottom: 3),
            child: GestureDetector(
              onTap: () {
                Get.to(MediaProfile(
                  isImage: true,
                  userImage: conImage.base64String,
                  username: usernameShared,
                  userId: int.parse(userIdShared!),
                ));
                // con.navigateToProfile(int.parse(userIdShared!));
              },
              child: Container(
                  height: 60,
                  width: 60,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  // child: widget.post.userimage != null
                  //     ? CachedNetworkImage(
                  //         width: MediaQuery.of(context).size.width,
                  //         imageUrl:
                  //             "http://${Constans.host}:8000/uploads/${widget.post.userimage}",
                  //         fit: BoxFit.cover)
                  child: conImage.base64String == null
                      ? Image.asset(
                          "assets/images/pers.png",
                          fit: BoxFit.cover,
                        )
                      : Image.memory(
                          base64Decode(conImage.base64String!),
                          fit: BoxFit.cover,
                        )),
            ),
          ),
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
            "Media",
            style: TextStyle(
                fontSize: 35,
                fontFamily: Constans.fontFamily,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView(children: [
        const Divider(
          height: 5,
          thickness: 5,
          indent: 0,
          endIndent: 0,
          color: Constans.screen,
        ),
        Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.09,
            child: AddPostWidget(
              
              ontap: () {
                con.navigateToAddPost();
              },
            )),
        const Divider(
          height: 5,
          thickness: 11,
          indent: 0,
          endIndent: 0,
          color: Constans.screen,
        ),
        GetBuilder<ControllerAddPost>(
          builder: (controller) {
            return FutureBuilder<List<PostModel>?>(
                future: con.postsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Shimmergym.Rectangle(
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width * 0.9,
                              radius: 1),
                        );
                      },
                    );
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
                    List<PostModel> postsList = snapshot.data!;
                    return postsList.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: con.postsList.length,
                            itemBuilder: (context, index) {
                              return PostWidget(
                                post: con.postsList[index],
                              );
                            },
                          )
                        : Container(
                            padding: const EdgeInsets.only(top: 250, left: 115),
                            child: const Text(
                              "No Posts yet ",
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
        )
      ]),
    );
  }
}
