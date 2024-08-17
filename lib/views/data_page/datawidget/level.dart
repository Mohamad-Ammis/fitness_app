import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/data_page/datawidget/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/datacont.dart';

// ignore: must_be_immutable
class Level extends StatelessWidget {
   Level({super.key});

   final controller = Get.put(Datacontroller() , permanent: true);

   // ignore: non_constant_identifier_names
   List Levels = [
    {
      "name":"beginner",
      "image":"assets/images/one.png",
      "id":"1",
      "des":"I don't play sports much and my level is beginner"
    },
    {
      "name":"intermediate",
      "image":"assets/images/two.png",
      "id":"2",
      "des":"Play sports intermittently or have committed to it recently"
    },
    {
      "name":"advanced",
      "image":"assets/images/three.png",
      "id":"3",
      "des":"Play sports continuously and have been committed to it for a long time"
    }
   ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,cont)=>SizedBox(
     height: cont.maxHeight,
     width: cont.maxWidth,
     child: GetBuilder<Datacontroller>(
       builder:(datacon)=> Column(
        children: [
          ques(cont),
          ...Levels.map((item) => active(context, item["id"],item["name"],item["image"], item["des"])),
         
        ],
       ),
     ),
    ));
  }

  Widget active(BuildContext context , String id , String name , String image , String des) {
    return InkWell(
      overlayColor: WidgetStatePropertyAll(Colors.amber.withOpacity(0)),
      onTap: () {
        controller.setlevel(int.parse(id));
      },
      child: Container(
          height: MediaQuery.of(context).size.height*0.13,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
          decoration: BoxDecoration(
            gradient: (controller.level==int.parse(id))?LinearGradient(colors: [
                              controller.deepcolor.withOpacity(0.25),
                             const Color.fromARGB(255, 165, 213, 222).withOpacity(0.3),
                               Colors.black.withOpacity(0.2) 
                            ] ,
                            begin: Alignment.topLeft ,
                            end: Alignment.bottomRight
                            ):null,
            border: Border.all(
              color:(controller.level==int.parse(id))?controller.deepcolor: Colors.black26,
              width: 0.5
            ),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            children: [
              Container(
                margin:const EdgeInsets.only(left: 10),
                height: MediaQuery.of(context).size.width*0.18,
                width: MediaQuery.of(context).size.width*0.16,
                child: Image.asset(image,fit: BoxFit.contain,),
              ),
              SizedBox(width: 7,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 4,left: 5),
                    height: MediaQuery.of(context).size.height*0.04,
                    width: MediaQuery.of(context).size.width*0.45,
                    child: Text(name , style: TextStyle(
                      fontFamily: Constans.fontFamily,
                        fontSize: MediaQuery.of(context).size.width*0.052 ,
                        fontWeight: FontWeight.bold ,
                        wordSpacing: 2 ,
                        color: controller.twocolor
                    ),),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 0,left: 5),
                    height: MediaQuery.of(context).size.height*0.075,
                    width: MediaQuery.of(context).size.width*0.55,
                    child: Text(des , style: TextStyle(
                      fontFamily: Constans.fontFamily,
                      fontSize: MediaQuery.of(context).size.width*0.032 ,
                       wordSpacing: 2 ,
                       color: const Color.fromARGB(255, 66, 66, 66)
                    ),),
                  ),
                ],
              ),
              Expanded(child: Container(
                padding: const EdgeInsets.only(top: 15,left: 4),
                alignment: Alignment.topLeft,
                    child:  Icon(Icons.task_alt,
                    color:(controller.level==int.parse(id))? const Color.fromARGB(255, 255, 100, 100):Colors.amber.withOpacity(0)),
                  ))
            ],
          ),
        ),
    );
  }

 

  Container ques(BoxConstraints cont) {
    return Container(
          width: cont.maxWidth,
          height: cont.maxHeight*0.19,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 10),
          child:  Question( que: "What's your Activity level  ? " , subt: "",)
         );
  }
}