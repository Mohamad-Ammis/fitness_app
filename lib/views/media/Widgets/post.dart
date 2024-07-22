import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/media/contra.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

// ignore: must_be_immutable
class PostWidget extends StatefulWidget {
  PostWidget({super.key, this.text, this.image});
  String? text;
  String? image;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  String image1 = "assets/images/like.png";
  bool current = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 2, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(color: const Color(0xffcfdef3)),
          // gradient: const LinearGradient(colors: [
          //   Color(0xffdae2f8),
          //   Color(0xffcfdef3),
          //   Color(0xff83a4d4),
          // ]),
          color: Colors.white.withOpacity(0.9),
          borderRadius: const BorderRadius.all(
            Radius.circular(1),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4, top: 10, left: 9),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const Contra());
                    },
                    child: const CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                          radius: 26,
                          backgroundImage: AssetImage("assets/images/mee.jpg")),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sedra Nadr",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: Constans.fontFamily,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "30min ago",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: Constans.fontFamily,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     showDialog(
                //         barrierDismissible: true,
                //         context: context,
                //         builder: (context) {
                //           return AlertDialog(
                //             // title: Text(
                //             //   titleText!,
                //             //   style: const TextStyle(fontFamily: Constans.fontFamily),
                //             // ),
                //             content: ElevatedButton(
                //               style: ElevatedButton.styleFrom(
                //                   shape: ContinuousRectangleBorder()),
                //               onPressed: () {},
                //               child: Text(
                //                 "Delete",
                //                 style: const TextStyle(
                //                   fontSize: 18,
                //                   fontFamily: "Lora",
                //                   color: Colors.red,
                //                 ),
                //               ),
                //             ),
                //           );
                //         });
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 130),
                //     child: SizedBox(
                //         height: 25,
                //         width: 25,
                //         child: Image.asset("assets/images/more.png")),
                //   ),
                // )
              ],
            ),
            widget.text != null
                ? Padding(
                    padding: const EdgeInsets.only(
                        left: 10, bottom: 10, right: 10, top: 10),
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Text(
                        widget.text!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: "Lora",
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                : Container(),
            widget.image != null
                ? Container(
                    margin: const EdgeInsets.only(left: 7, right: 7, top: 7),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: Constans.screen,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 0.89,
                    child: Image.asset(
                      widget.image!,
                      fit: BoxFit.contain,
                    ),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        current = !current;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 7, top: 5, left: 15, bottom: 7),
                      child: SizedBox(
                          height: 26,
                          width: 26,
                          child: Image.asset(
                            current == true
                                ? "assets/images/care2.png"
                                : "assets/images/care.png",
                            color: current == true
                                ? const Color.fromARGB(255, 128, 173, 242)
                                : Colors.black,
                          )),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5, left: 1, bottom: 0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        "104895",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: Constans.fontFamily,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.only(top: 5, left: 7, bottom: 0),
                  //   child: Text(
                  //     "Likes",
                  //     style: TextStyle(
                  //       fontSize: 15,
                  //       fontFamily: Constans.fontFamily,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 5, left: 5, bottom: 0),
                  //   child: Container(
                  //     height: 18,
                  //     width: 1,
                  //     color: Colors.black54,
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 25, bottom: 0),
                      child: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                            "assets/images/chat (3).png",
                          )),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5, left: 5, bottom: 0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        "1045",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: Constans.fontFamily,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.only(top: 5, left: 7, bottom: 0),
                  //   child: Text(
                  //     "Comments",
                  //     style: TextStyle(
                  //       fontSize: 15,
                  //       fontFamily: Constans.fontFamily,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
