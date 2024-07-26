import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/home.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/widgets/warning.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Button extends StatelessWidget {
   Button({super.key});
  final controller = Get.put(Datacontroller() , permanent: true);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.12,
      child: Row(
        children: [
          const Spacer(),
          GetBuilder<Datacontroller>(
              builder: (cont) => Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 20),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: (cont.index) <= 5
                          ? ElevatedButton(
                              onPressed: () {
                                if (cont.index == 0) {
                                  if (cont.man != 0) {
                                    controller.control.nextPage(
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.bounceOut);
                                    controller.nextpercent();
                                  }
                                } else if (cont.index == 1) {
                                  if (cont.selectgoal.isEmpty) {
                                  } else {
                                    controller.control.nextPage(
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.bounceOut);
                                    controller.nextpercent();
                                  }
                                } else if (cont.index == 2) {
                                  controller.control.nextPage(
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.bounceOut);
                                  controller.nextpercent();
                                } else if (cont.index == 3) {
                                  if (controller.activity != 0) {
                                    controller.control.nextPage(
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.bounceOut);
                                    controller.nextpercent();
                                  }
                                } else if (cont.index == 4) {
                                  if (cont.selectfocusarea != 0) {
                                    controller.control.nextPage(
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.bounceOut);
                                    controller.nextpercent();
                                  }
                                } else if (cont.index == 5) {
                                  /* if(cont.pickedimage != null ){
                               controller.control.nextPage(duration: const Duration(seconds: 1), curve: Curves.bounceOut);
                               controller.nextpercent();
                            } */
<<<<<<< HEAD
                                  controller.control.nextPage(
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.bounceOut);
                                  controller.nextpercent();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: controller.basiccolor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: childbutton("Next"))
                          : ElevatedButton(
                              onPressed: () async {
                                cont.Load(true);
                                for (int i = 0; i < cont.days.length; i++) {
                                  cont.User_data["training_days[${i + 1}]"] =
                                      cont.days[i].toString();
                                }
                                cont.setUser_Data();
                                try {
                                  await cont.Setdata();
                                } catch (error) {
                                  showDialog(
                                      // ignore: use_build_context_synchronously
                                      context: context,
                                      builder: (ctxx) => const Warning(
                                          warn:
                                              "This something wrong , Please Try Again"));
                                }
                                //  print(cont.User_data);
                                cont.Load(false);
                                preference!.setInt("man", controller.man);
                                if (controller.base64String != null) {
                                  preference!.setString(
                                      "image", controller.base64String!);
                                }
                                Get.offAll(const Home());
                                print(preference!.getInt("is"));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: controller.basiccolor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: childbutton("Done")),
                    ),
                  ))
        ],
      ),
    );
=======
                             controller.control.nextPage(duration: const Duration(seconds: 1), curve: Curves.bounceOut);
                               controller.nextpercent();
                          }
                          
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: controller.basiccolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                         child: childbutton("Next")):ElevatedButton(onPressed: ()async{
                          cont.Load(true);
                       for(int i = 0 ; i<cont.days.length ; i++){
                        cont.User_data["training_days[${i+1}]"] = cont.days[i].toString();
                       }
                       cont.setUser_Data();
                        try{
                         await cont.Setdata();
                        }catch(error){
                          showDialog(
                            // ignore: use_build_context_synchronously
                            context: context,
                            builder: (ctxx) =>const Warning(warn: "This something wrong , Please Try Again"));
                        }
                       cont.Load(false);
                       userInfo!.setInt("man", controller.man);
                       userInfo!.setString("target", controller.User_data["target"]!);
                       userInfo!.setString("illness", controller.User_data['diseases']!);
                       if(controller.base64String!= null){userInfo!.setString("image", controller.base64String!);}
                       Get.offAll(Home());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: controller.basiccolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                       child: childbutton("Done")),
                      ),
                    )
                  )
                ],
              ),
            );
>>>>>>> 8f5b8c838a2980b8dcbf717d6883e5bf3ca10d2f
  }


  Container childbutton(String s) {
    return Container(
                    alignment: Alignment.center,
                    padding:const EdgeInsets.symmetric(horizontal: 20 , vertical: 8),
                    height: 60,
                    width: 150,
                    child:  Text(s , style: const TextStyle(
                      fontFamily: "WorkSans",
                      fontSize: 25 ,
                      fontWeight: FontWeight.bold ,
                      color: Colors.white
                    ),),
                   );
  }

}