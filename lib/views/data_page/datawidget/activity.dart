import 'package:fitnessapp/views/data_page/datawidget/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/datacont.dart';

// ignore: must_be_immutable
class Activity extends StatelessWidget {
   Activity({super.key});

   final controller = Get.put(Datacontroller() , permanent: true);

   // ignore: non_constant_identifier_names
   List Allactiv = [
    {
      "name":"Sedentary",
      "image":"assets/images/stu.png",
      "id":"1",
      "des":"I sit at my desk all day"
    },
    {
      "name":"Lightly active",
      "image":"assets/images/lact.png",
      "id":"2",
      "des":"I occasionally exercise or walk for 30 minutes"
    },
    {
      "name":"Very active",
      "image":"assets/images/hact.png",
      "id":"3",
      "des":"I love working out , and want to get more exercises"
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
          ...Allactiv.map((item) => active(context, item["id"],item["name"],item["image"], item["des"])),
         
        ],
       ),
     ),
    ));
  }

  Widget active(BuildContext context , String id , String name , String image , String des) {
    return InkWell(
      overlayColor: MaterialStatePropertyAll(Colors.amber.withOpacity(0)),
      onTap: () {
        controller.setactivity(int.parse(id));
      },
      child: Container(
          height: MediaQuery.of(context).size.height*0.13,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
          decoration: BoxDecoration(
            gradient: (controller.activity==int.parse(id))?LinearGradient(colors: [
                              controller.deepcolor.withOpacity(0.25),
                             const Color.fromARGB(255, 165, 213, 222).withOpacity(0.3),
                               Colors.black.withOpacity(0.2) 
                            ] ,
                            begin: Alignment.topLeft ,
                            end: Alignment.bottomRight
                            ):null,
            border: Border.all(
              color:(controller.activity==int.parse(id))?controller.deepcolor: Colors.black26,
              width: 0.5
            ),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            children: [
              Container(
                margin:const EdgeInsets.only(left: 10),
                height: MediaQuery.of(context).size.width*0.25,
                width: MediaQuery.of(context).size.width*0.2,
                child: Image.asset(image,fit: BoxFit.contain,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 8,left: 5),
                    height: MediaQuery.of(context).size.height*0.05,
                    width: MediaQuery.of(context).size.width*0.45,
                    child: Text(name , style: TextStyle(
                      fontFamily: "WorkSans",
                        fontSize: MediaQuery.of(context).size.width*0.058 ,
                        fontWeight: FontWeight.bold ,
                        wordSpacing: 2 ,
                        color: controller.twocolor
                    ),),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 3,left: 5),
                    height: MediaQuery.of(context).size.height*0.06,
                    width: MediaQuery.of(context).size.width*0.55,
                    child: Text(des , style: TextStyle(
                      fontFamily: "WorkSans",
                      fontSize: MediaQuery.of(context).size.width*0.035 ,
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
                    color:(controller.activity==int.parse(id))? const Color.fromARGB(255, 255, 100, 100):Colors.amber.withOpacity(0)),
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