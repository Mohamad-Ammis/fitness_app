import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/add_post_controller.dart';

import 'package:fitnessapp/helper/gallery_saver.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/models/post_model.dart';
import 'package:fitnessapp/views/media/comments.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PostWidget extends StatefulWidget {
  PostModel post = PostModel();
  Widget? numberlike;

  PostWidget({super.key, required this.post, this.numberlike});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  ControllerAddPost controller1 = Get.put(ControllerAddPost(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerAddPost>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.only(left: 5, right: 2, bottom: 0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: const BorderRadius.all(
                Radius.circular(1),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller1.navigateToProfile(widget.post.userId,
                            widget.post.username, widget.post.userimage, false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, left: 5),
                        child: Container(
                          height: 60,
                          width: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: widget.post.userimage != null
                              ? CachedNetworkImage(
                                  width: MediaQuery.of(context).size.width,
                                  imageUrl:
                                      "${Constans.mainbaseUrlimage}uploads/${widget.post.userimage}",
                                  fit: BoxFit.cover)
                              : Image.asset(
                                  "assets/images/pers.png",
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.post.username!,
                              style: const TextStyle(
                                fontSize: 22,
                                fontFamily: Constans.fontFamily,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "${getTimeAgo()} ago",
                              style: const TextStyle(
                                fontSize: 13,
                                fontFamily: Constans.fontFamily,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    widget.post.username == userInfo!.getString("name")
                        ? GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      color: Colors.black,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      width: MediaQuery.of(context).size.width,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape:
                                                const ContinuousRectangleBorder(),
                                            backgroundColor: Colors.grey[500]),
                                        onPressed: () {
                                          showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (context) {
                                                return controller1.isLoading ==
                                                        false
                                                    ? AlertDialog(
                                                        shape:
                                                            const ContinuousRectangleBorder(),
                                                        content: const Text(
                                                          "Are you sure about deleting the post? ",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontFamily: Constans
                                                                  .fontFamily,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        actions: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Get.back();
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                    "Cancel",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .black,
                                                                        fontFamily:
                                                                            Constans.fontFamily),
                                                                  )),
                                                              GetBuilder<
                                                                  ControllerAddPost>(
                                                                builder:
                                                                    (controller) {
                                                                  return TextButton(
                                                                      onPressed:
                                                                          () async {
                                                                        controller1
                                                                            .isLoadingTure();
                                                                        try {
                                                                          await controller1.deletePost(widget
                                                                              .post
                                                                              .id);

                                                                          Get.snackbar(
                                                                              'Success',
                                                                              'Post deleted successfully');
                                                                          Navigator.pop(
                                                                              context);
                                                                          controller1
                                                                              .refreshPosts();
                                                                          controller1
                                                                              .update();
                                                                          controller1.getUserPostsAndBio(widget
                                                                              .post
                                                                              .userId);
                                                                        } catch (e) {
                                                                          Get.snackbar(
                                                                            'Error',
                                                                            'No Internet. Please try again later.',
                                                                          );
                                                                        }
                                                                        controller1
                                                                            .isLoadingFalse();
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        "Delete",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.red,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontFamily: Constans.fontFamily),
                                                                      ));
                                                                },
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    : const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 170,
                                                                left: 10),
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: Colors.black,
                                                        ),
                                                      );
                                              });
                                        },
                                        child: const Text(
                                          "Delete",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: "Lora",
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: SizedBox(
                                    height: 25,
                                    width: 25,
                                    child:
                                        Image.asset("assets/images/more.png")),
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
                widget.post.textPost != null
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 10, right: 10, top: 10),
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          child: Text(
                            widget.post.textPost!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: "Lora",
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    : Container(),
                widget.post.imagesPost != null &&
                        widget.post.imagesPost!.isNotEmpty
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 0, right: 0, top: 7),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.55,
                          child: ListView.builder(
                            itemCount: widget.post.imagesPost!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, ind) {
                              return Stack(children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(0),
                                    ),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.55,
                                  width: MediaQuery.of(context).size.width,
                                  child: CachedNetworkImage(
                                    width: MediaQuery.of(context).size.width,
                                    imageUrl:
                                        "${Constans.mainbaseUrlimage}uploads/${widget.post.imagesPost![ind].path}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top:
                                      MediaQuery.of(context).size.height * 0.02,
                                  left:
                                      MediaQuery.of(context).size.width * 0.82,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.4),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    height: 24,
                                    width: 50,
                                    child: Center(
                                      child: Text(
                                        "${ind + 1}/${widget.post.imagesPost!.length}",
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontFamily: "Lora",
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom:
                                      MediaQuery.of(context).size.height * 0.02,
                                  left:
                                      MediaQuery.of(context).size.width * 0.82,
                                  child: widget.post.imagesPost != null &&
                                          widget.post.imagesPost!.isNotEmpty
                                      ? GestureDetector(
                                          onTap: () {
                                          
                                            saveAsset(
                                                "${Constans.mainbaseUrlimage}uploads/${widget.post.imagesPost![ind].path}",
                                                context);
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                                top: 5, left: 25, bottom: 0),
                                            child: SizedBox(
                                                height: 35,
                                                width: 35,
                                                child: Icon(
                                                  color: Colors.white,
                                                  Icons.download,
                                                  size: 30,
                                                )),
                                          ),
                                        )
                                      : Container(),
                                )
                              ]);
                            },
                          ),
                        ))
                    : Container(),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (widget.post.islike == false) {
                            controller1.likePost(widget.post.id).then((value) {
                              widget.post.islike = true;
                              widget.post.likesCount =
                                  widget.post.likesCount! + 1;
                              controller1.update();
                            });
                          } else {
                            controller1
                                .unlikePost(widget.post.id)
                                .then((value) {
                              widget.post.islike = false;
                              widget.post.likesCount =
                                  widget.post.likesCount! - 1;
                              controller1.update();
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 7, top: 5, left: 15, bottom: 7),
                          child: SizedBox(
                              height: 26,
                              width: 26,
                              child: Image.asset(
                                widget.post.islike == true
                                    ? "assets/images/care2.png"
                                    : "assets/images/care.png",
                                color: widget.post.islike == true
                                    ? const Color(0xff83a4d4)
                                    : Colors.black,
                              )),
                        ),
                      ),
                      GetBuilder<ControllerAddPost>(
                        builder: (controller) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 1, bottom: 0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                widget.post.likesCount!.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: Constans.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            clipBehavior: Clip.antiAlias,
                            backgroundColor: Constans.screen,
                            shape: const ContinuousRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),
                            ),
                            isScrollControlled: false,
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(builder:
                                  (BuildContext context, StateSetter setState) {
                                return CommentView(
                                  postId: widget.post.id.toString(),
                                  userId: widget.post.userId,
                                  commentsList: widget.post.comments,
                                );
                              });
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 25, bottom: 0),
                          child: SizedBox(
                              height: 25,
                              width: 25,
                              child: Image.asset(
                                "assets/images/chat (3).png",
                              )),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 5, left: 5, bottom: 0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            widget.post.commentsCount.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: Constans.fontFamily,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 5,
                  thickness: 5,
                  indent: 0,
                  endIndent: 0,
                  color: Constans.screen,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void saveAsset(String path, BuildContext context) {
    if (widget.post.imagesPost != null && widget.post.imagesPost!.isNotEmpty) {
      if (widget.post.imagesPost != null &&
          widget.post.imagesPost!.isNotEmpty) {
        GallerySaverHelper().saveNetworkImage(path, context);
      } else {
        GallerySaverHelper().saveAssestImage(path, context);
      }
    }
    // if (widget.hasVideo) {
    //   GallerySaverHelper().saveNetworkVideoFile(path, context);
    // }
  }

  String getTimeAgo() {
    String timeAgo = "";
    Duration difference = DateTime.now().difference(widget.post.time!);
    if (difference.inMinutes < 1) {
      timeAgo = "Now";
    } else if (difference.inMinutes < 60) {
      timeAgo = "${difference.inMinutes} min";
    } else if (difference.inHours < 24) {
      timeAgo = "${difference.inHours} hours";
    } else {
      timeAgo = "${difference.inDays} days";
    }

    return timeAgo;
  }
}
