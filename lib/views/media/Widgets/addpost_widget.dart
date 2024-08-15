import 'dart:convert';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/datacont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AddPostWidget extends StatefulWidget {
  AddPostWidget({super.key, this.ontap, });
  void Function()? ontap;


  @override
  State<AddPostWidget> createState() => _AddPostWidgetState();
}

class _AddPostWidgetState extends State<AddPostWidget> {
  Datacontroller conImage = Get.put(Datacontroller(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap!,
      child: Padding(
        padding: const EdgeInsets.only(top: 2, left: 15, right: 10, bottom: 0),
        child: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
            padding: const EdgeInsets.only(
              left: 0,
              top: 0,
            ),
            height: MediaQuery.of(context).size.height * 0.075,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
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
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "What's on your mind...?",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontFamily: Constans.fontFamily),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.0099,
            left: MediaQuery.of(context).size.width * 0.8,
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.only(left: 2, right: 2),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Image(
                  image: AssetImage("assets/images/gallery.png"),
                ),
              ),
            ),
          ),
       
        ]),
      ),
    );
  }
}
