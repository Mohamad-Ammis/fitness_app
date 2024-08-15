// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:fitnessapp/controller/add_post_controller.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/views/media/media_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  Datacontroller conAdd = Get.put(Datacontroller(), permanent: true);
  bool? isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Get.off(const MediaHome());
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 25,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "Create Post",
            style: TextStyle(
              fontSize: 22,
              fontFamily: Constans.fontFamily,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView(children: [
          isLoading == true
              ? Padding(
                  padding: const EdgeInsets.only(top: 300),
                  child: SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.asset(
                        "assets/images/loading.png",
                      )),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 30, left: 12, right: 10),
                  child: GetBuilder<ControllerAddPost>(
                    builder: (controller) {
                      return Container(
                        height: controller.images.isEmpty
                            ? MediaQuery.of(context).size.height * 0.2
                            : MediaQuery.of(context).size.height * 0.51,
                        width: MediaQuery.of(context).size.width * 0.94,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            color: Constans.screen,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.14,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 12, top: 5),
                                    child: ShaderMask(
                                      blendMode: BlendMode.srcATop,
                                      shaderCallback: (bounds) =>
                                          const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color.fromARGB(255, 11, 45, 75),
                                          Color.fromARGB(255, 75, 113, 168),
                                          Color.fromARGB(255, 116, 135, 185)
                                        ],
                                      ).createShader(bounds),
                                      child: const Text(
                                        "Title",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: Constans.fontFamily,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 53,
                                          height: 55,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: conAdd.base64String == null
                                              ? Image.asset(
                                                  "assets/images/pers.png",
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.memory(
                                                  base64Decode(
                                                      conAdd.base64String!),
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 2),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.715,
                                            child: Form(
                                              child: TextFormField(
                                                controller: controller.textPost,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText:
                                                      "Write Something here...",
                                                  border: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black)),
                                                  focusColor: Colors.black,
                                                  contentPadding:
                                                      EdgeInsets.only(left: 10),
                                                ),
                                                onSaved: (value) {
                                                  controller.textPost.text =
                                                      value!;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            controller.images.isNotEmpty
                                ? SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.31,
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, top: 3, bottom: 2),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ShaderMask(
                                                blendMode: BlendMode.srcATop,
                                                shaderCallback: (bounds) =>
                                                    const LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Color.fromARGB(
                                                        255, 11, 45, 75),
                                                    Color.fromARGB(
                                                        255, 75, 113, 168),
                                                    Color.fromARGB(
                                                        255, 116, 135, 185)
                                                  ],
                                                ).createShader(bounds),
                                                child: const Text(
                                                  "Photos",
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontFamily:
                                                          Constans.fontFamily,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10, top: 5),
                                                child: Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        controller.getImages();
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 0,
                                                                left: 2,
                                                                bottom: 0),
                                                        child: SizedBox(
                                                            height: 17,
                                                            width: 17,
                                                            child: Image.asset(
                                                              "assets/images/addmore.png",
                                                            )),
                                                      ),
                                                    ),
                                                    const Text(
                                                      "Add more",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontFamily: Constans
                                                              .fontFamily,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.25,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            physics:
                                                const AlwaysScrollableScrollPhysics(),
                                            itemCount: controller.images.length,
                                            itemBuilder: (context, inde) =>
                                                Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, top: 8),
                                              child: Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.25,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.5,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Constans.screen,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                      child: Image(
                                                        fit: BoxFit.cover,
                                                        image: FileImage(File(
                                                            controller
                                                                .images[inde]
                                                                .path)),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.002,
                                                      left:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.39,
                                                      child: IconButton(
                                                        onPressed: () {
                                                          print(FileImage(File(
                                                              controller
                                                                  .images[inde]
                                                                  .path)));
                                                          setState(() {
                                                            controller.images
                                                                .removeAt(inde);
                                                          });
                                                        },
                                                        icon: const Icon(
                                                          Icons.cancel_outlined,
                                                          size: 32,
                                                          color: Colors.white,
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2),
                                                      ),
                                                    )
                                                  ]),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 3,
                                  ),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Add",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: Constans.fontFamily,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          controller.getImages();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 0, left: 10, bottom: 0),
                                          child: SizedBox(
                                              height: 26,
                                              width: 26,
                                              child: Image.asset(
                                                "assets/images/gallery.png",
                                              )),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          print(controller.textPost.text);

                                          print(controller.images);
                                          setState(() {
                                            isLoading = true;
                                          });
                                          try {
                                            int statusCode =
                                                await controller.addPostFun();
                                            if (statusCode == 200) {
                                              Get.snackbar('Success',
                                                  'Post added successfully');

                                              setState(() {
                                                controller.images.clear();
                                                controller.textPost.clear();
                                              });
                                            }
                                          } catch (e) {
                                            Get.snackbar(
                                              'Error',
                                              'No Internet. Please try again later.',
                                            );
                                          }

                                          setState(() {
                                            isLoading = false;
                                          });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.42,
                                          ),
                                          child: Container(
                                            height: 35,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 11, 45, 75),
                                                  Color.fromARGB(
                                                      255, 75, 113, 168),
                                                  Color.fromARGB(
                                                      255, 116, 135, 185)
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "Share",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
        ]));
  }
}
