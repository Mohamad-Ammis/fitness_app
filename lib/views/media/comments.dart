import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/add_post_controller.dart';
import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

// ignore: must_be_immutable
class CommentView extends StatefulWidget {
  String? postId;
  int? userId;
  List<CommentModel>? commentsList;
  CommentView({super.key, this.postId, this.commentsList, this.userId});

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  ControllerAddPost conComment = Get.put(ControllerAddPost(), permanent: true);
  Datacontroller conImage = Get.put(Datacontroller(), permanent: true);
  bool isLoadingCo = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerAddPost>(
      builder: (controller) {
        return KeyboardAvoider(
            autoScroll: true,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width,
                  color: Constans.screen,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Center(
                          child: Container(
                            height: 5,
                            width: 60,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                color: Colors.grey),
                          ),
                        ),
                      ),
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            "Comments",
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: Constans.fontFamily,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                ),
                GetBuilder<ControllerAddPost>(
                  builder: (controller) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      color: Constans.screen,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: widget.commentsList!.length,
                        itemBuilder: (context, index) {
                          return commentWidget(
                            textComment:
                                widget.commentsList![index].textComment,
                            imageComment:
                                widget.commentsList![index].imageComment,
                            username: widget.commentsList![index].username,
                            imageuser: widget.commentsList![index].userimage,
                            likesCommentConut:
                                widget.commentsList![index].likesCommentCount,
                            idComment: widget.commentsList![index].idComment,
                            islikeComment:
                                widget.commentsList![index].islikeComment,
                            userId: widget.userId,
                            heartText: GetBuilder<ControllerAddPost>(
                              builder: (controller) {
                                return Text(
                                  index < widget.commentsList!.length
                                      ? widget.commentsList![index]
                                          .likesCommentCount!
                                          .toString()
                                      : " ",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: Constans.fontFamily,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            ),
                            heart: GetBuilder<ControllerAddPost>(
                              builder: (controller) {
                                return IconButton(
                                    onPressed: () {
                                      if (widget.commentsList![index]
                                              .islikeComment ==
                                          false) {
                                        conComment
                                            .likeComment(widget
                                                .commentsList![index].idComment)
                                            .then((value) {
                                          widget.commentsList![index]
                                              .islikeComment = true;
                                          widget.commentsList![index]
                                              .likesCommentCount = widget
                                                  .commentsList![index]
                                                  .likesCommentCount! +
                                              1;

                                          conComment.update();
                                        });
                                      } else {
                                        conComment
                                            .unlikeComment(widget
                                                .commentsList![index].idComment)
                                            .then((value) {
                                          widget.commentsList![index]
                                              .islikeComment = false;

                                          widget.commentsList![index]
                                              .likesCommentCount = widget
                                                  .commentsList![index]
                                                  .likesCommentCount! -
                                              1;

                                          conComment.update();
                                        });
                                      }
                                    },
                                    icon: index < widget.commentsList!.length
                                        ? Icon(
                                            widget.commentsList![index]
                                                        .islikeComment ==
                                                    true
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            size: 23,
                                            color: widget.commentsList![index]
                                                        .islikeComment ==
                                                    true
                                                ? Colors.red
                                                : Colors.grey)
                                        : Container());
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                Container(
                  height: conComment.imageComment != null
                      ? MediaQuery.of(context).size.height * 0.2
                      : MediaQuery.of(context).size.height * 0.082,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: conImage.base64String == null
                                  ? Image.asset(
                                      "assets/images/pers.png",
                                      fit: BoxFit.cover,
                                    )
                                  : Image.memory(
                                      base64Decode(conImage.base64String!),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.57,
                                child: Form(
                                  child: TextFormField(
                                    focusNode: conComment.textFieldFocusNode,
                                    controller: conComment.textComment,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Write Something here...",
                                      contentPadding: EdgeInsets.only(left: 10),
                                    ),
                                    onChanged: (value) {                                     
                                      setState(() {
                                        conComment.textComment.text = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                conComment.getImageComment();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 0, left: 40, right: 7),
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
                                if (conComment.textComment.text.isNotEmpty ||
                                    conComment.imageComment != null) {
                                  setState(() {
                                    isLoadingCo = true;
                                  });
                                  try {
                                    int statusCode = await conComment
                                        .addCommentFun(widget.postId!);

                                    if (statusCode == 200) {
                                      Get.snackbar('Success',
                                          'Comment added successfully');

                                      setState(() {
                                        conComment.imageComment = null;
                                        conComment.textComment.clear();
                                      });

                                      widget.commentsList!
                                          .add(conComment.newComment);
                                      conComment.update();
                                      conComment.refreshPosts();
                                      conComment
                                          .getUserPostsAndBio(widget.userId);
                                    }
                                  } catch (e) {
                                    Get.snackbar(
                                      'Error',
                                      'No Internet. Please try again later.',
                                    );
                                  }

                                  setState(() {
                                    isLoadingCo = false;
                                  });
                                }
                              },
                              child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset(
                                    conComment.textComment.text.isEmpty &&
                                            conComment.imageComment == null
                                        ? "assets/images/send (1).png"
                                        : "assets/images/send.png",
                                    color:
                                        conComment.textComment.text.isEmpty &&
                                                conComment.imageComment == null
                                            ? Colors.grey
                                            : Colors.blue,
                                  )),
                            ),
                          ],
                        ),
                        conComment.imageComment != null
                            ? Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child:
                                    Stack(clipBehavior: Clip.none, children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.11,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        color: Constans.screen,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Image(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      fit: BoxFit.cover,
                                      image:
                                          FileImage(conComment.imageComment!),
                                    ),
                                  ),
                                  Positioned(
                                    top: MediaQuery.of(context).size.height *
                                        0.00000001,
                                    left: MediaQuery.of(context).size.width *
                                        0.39,
                                    child: IconButton(
                                      onPressed: () {
                                        conComment.imageComment = null;

                                        setState(() {});
                                      },
                                      icon: const Icon(
                                        Icons.cancel_outlined,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.all(2),
                                    ),
                                  )
                                ]),
                              )
                            : Container()
                      ],
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }

  Padding commentWidget(
      {String? textComment,
      Widget? heart,
      Widget? heartText,
      String? imageComment,
      String? imageuser,
      String? username,
      bool? islikeComment,
      int? likesCommentConut,
      int? idComment,
      int? userId}) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, right: 5, top: 9),
      child: GestureDetector(
        onTap: () {
          username == userInfo!.getString("name")
              ? showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      color: Colors.black,
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const ContinuousRectangleBorder(),
                            backgroundColor: Colors.grey[500]),
                        onPressed: () {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: const ContinuousRectangleBorder(),
                                  content: const Text(
                                    "Are you sure about deleting the comment? ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: Constans.fontFamily,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: const Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontFamily:
                                                      Constans.fontFamily),
                                            )),
                                        TextButton(
                                            onPressed: () async {
                                              conComment.isLoadingTure();
                                              try {
                                                await conComment
                                                    .deleteComment(idComment);

                                                Get.snackbar('Success',
                                                    'Comment deleted successfully');

                                                Navigator.pop(context);
                                                widget.commentsList!
                                                    .removeWhere((comment) =>
                                                        comment.idComment ==
                                                        idComment);
                                                conComment.update();
                                                conComment.refreshPosts();
                                                conComment
                                                    .getUserPostsAndBio(userId);
                                              } catch (e) {
                                                Get.snackbar(
                                                  'Error',
                                                  'No Internet. Please try again later.',
                                                );
                                              }
                                              conComment.isLoadingFalse();
                                            },
                                            child: const Text(
                                              "Delete",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily:
                                                      Constans.fontFamily),
                                            ))
                                      ],
                                    )
                                  ],
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
                  })
              : Container();
        },
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                  ),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: imageuser != null
                        ? CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                "${Constans.mainbaseUrlimage}uploads/$imageuser",
                          )
                        : const Image(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/pers.png"),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: Constans.fontFamily,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      textComment != null
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: SingleChildScrollView(
                                child: Text(
                                  textComment,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: Constans.fontFamily,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      imageComment != null
                          ? Container(
                              margin: const EdgeInsets.only(
                                  left: 0, right: 0, top: 2, bottom: 4),
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                color: Constans.screen,
                              ),
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: CachedNetworkImage(
                                width: MediaQuery.of(context).size.width * 0.65,
                                fit: BoxFit.contain,
                                imageUrl:
                                    "${Constans.mainbaseUrlimage}uploads/$imageComment",
                              ))
                          : Container(),                
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Column(
                    children: [
                      heart!,
                      heartText!,
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              height: 1,
              thickness: 0.5,
              indent: 0,
              endIndent: 0,
              color: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }
}
