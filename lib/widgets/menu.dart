// ignore_for_file: prefer_const_constructors

import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/auth_controller.dart';
import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/helper/custom_toast_notification.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/models/menuItem.dart';
import 'package:fitnessapp/models/menuitems.dart';
import 'package:fitnessapp/views/auth_pages/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Menupage extends StatelessWidget {
  final Menuitem currentitem;
  final ValueChanged<Menuitem> onselecteditem;
  Menupage(
      {super.key, required this.currentitem, required this.onselecteditem});

  final controller = Get.put(Datacontroller(), permanent: true);
  final authController = Get.put(AuthController());
  String fcm = "";
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(children: [
          Opacity(
            opacity: 0.45,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/b6.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 3,
              ),
              ...Menuitems.all
                  .map(
                    (item) => ListTileTheme(
                      selectedTileColor: Color.fromARGB(255, 58, 76, 77),
                      selectedColor: Color.fromARGB(255, 172, 245, 242),
                      child: ListTile(
                        style: ListTileStyle.drawer,
                        selected: item == currentitem,
                        leading: Icon(
                          item.icon,
                          size: item == currentitem ? 40 : 30,
                        ),
                        title: Text(item.title,
                            style: item == currentitem
                                ? TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.065,
                                    fontFamily: Constans.fontFamily,
                                    fontWeight: FontWeight.bold)
                                : TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.057,
                                    fontFamily: Constans.fontFamily,
                                  )),
                        onTap: () => onselecteditem(item),
                      ),
                    ),
                  )
                  .toList(),
              SizedBox(
                height: 150,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: Colors.white),
                    borderRadius: BorderRadius.circular(40)),
                child: GetBuilder<AuthController>(builder: (authController) {
                  return TextButton(
                      onPressed: () async {
                        var status = await authController.logout();
                        if (status) {
                          fcm = userInfo!.getString('fcm_token')!;
                          userInfo!.clear();
                          userInfo!.setString('fcm_token', fcm);
                          controller.setlogout();
                          Get.offAll(LogInPage());
                        } else {
                          showErrorSnackBar(
                              "Error Happened", "please try again ");
                        }
                      },
                      child: Text("Logout",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontFamily: Constans.fontFamily,
                          )));
                }),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
