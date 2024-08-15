import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/add_post_controller.dart';
import 'package:fitnessapp/main.dart';

import 'package:fitnessapp/views/media/Widgets/addpost_widget.dart';
import 'package:fitnessapp/views/media/Widgets/post.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MediaProfile extends StatefulWidget {
  int? userId;
  String? username;
  String? userImage;
  bool? isImage;
  MediaProfile(
      {super.key, this.userId, this.userImage, this.username, this.isImage});

  @override
  State<MediaProfile> createState() => _MediaProfileState();
}

class _MediaProfileState extends State<MediaProfile> {
  ControllerAddPost conUser = Get.put(ControllerAddPost(), permanent: true);
  bool? isLoadingUser = false;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  void loadData() async {
    setState(() {
      isLoadingUser = true;
    });
    try {
      await conUser.getUserPostsAndBio(widget.userId);
      conUser.update();
    } catch (e) {
      Get.snackbar(
        'Error',
        'No Internet. Please try again later.',
      );
    }
    setState(() {
      isLoadingUser = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: isLoadingUser == false
            ? GetBuilder<ControllerAddPost>(
                builder: (controller) {
                  return ListView(
                    children: [
                      Stack(clipBehavior: Clip.none, children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            color: Constans.screen,
                          ),
                          height: MediaQuery.of(context).size.height * 0.23,
                          width: MediaQuery.of(context).size.width,
                          child: Opacity(
                            opacity: 0.9,
                            child: Image.asset(
                              "assets/images/photo_profile.jpg",
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
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.13,
                          left: MediaQuery.of(context).size.width * 0.09,
                          child: SizedBox(
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 4, top: 10, left: 9),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.33,
                                    height: MediaQuery.of(context).size.height *
                                        0.18,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: widget.userImage != null
                                        ? widget.isImage == false
                                            ? CachedNetworkImage(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                imageUrl:
                                                    "${Constans.mainbaseUrlimage}uploads/${widget.userImage}",
                                                fit: BoxFit.cover)
                                            : Image.memory(
                                                base64Decode(widget.userImage!),
                                                fit: BoxFit.cover,
                                              )
                                        : Image.asset(
                                            "assets/images/pers.png",
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                )),
                          ),
                        ),
                      ]),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.09,
                            left: MediaQuery.of(context).size.width * 0.05),
                        child: Text(
                          widget.username!,
                          style: const TextStyle(
                            fontSize: 28,
                            fontFamily: Constans.fontFamily,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 15, right: 10, bottom: 10),
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Text(
                            conUser.userPostAndBio.bio != null
                                ? conUser.userPostAndBio.bio! == "null"
                                    ? "  "
                                    : conUser.userPostAndBio.bio!
                                : "  ",
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Lora",
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 5,
                        thickness: 5,
                        indent: 0,
                        endIndent: 0,
                        color: Constans.screen,
                      ),
                      userInfo?.getString('name') == widget.username
                          ? Container(
                              color: Colors.white,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.14,
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 5, left: 15, bottom: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Posts",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: Constans.fontFamily,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AddPostWidget(
                                    ontap: () {
                                      conUser.navigateToAddPost();
                                    },
                                  )
                                ],
                              ),
                            )
                          : Container(),
                      const Divider(
                        height: 5,
                        thickness: 11,
                        indent: 0,
                        endIndent: 0,
                        color: Constans.screen,
                      ),
                      conUser.userPostAndBio.post != null &&
                              conUser.userPostAndBio.post!.isNotEmpty
                          ? GetBuilder<ControllerAddPost>(
                              builder: (controller) {
                                return ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        conUser.userPostAndBio.post!.length,
                                    itemBuilder: (context, index) {
                                      return PostWidget(
                                        post:
                                            conUser.userPostAndBio.post![index],
                                      );
                                    });
                              },
                            )
                          : const Center(child: Text("No Posts yet"))
                    ],
                  );
                },
              )
            : Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.46,
                    left: MediaQuery.of(context).size.width * 0.44),
                child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      "assets/images/time (1).png",
                    )),
              ));
  }
}
