import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/views/data_page/datawidget/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Target extends StatelessWidget {
   Target({super.key});
//2
   List goalsw =[
    {
      'name':'Lose Weight',
      'image':'assets/images/lose.png',
      'id':'1'
    },
    {
      'name':'Build muscle',
      'image':'assets/images/mus.png',
      'id':'2'
    },
    {
      'name':'Keep fit',
      'image':'assets/images/fitt.png',
      'id':'3'
    }
   ];
//1
   List goalsm =[
    {
      'name':'Lose Weight',
      'image':'assets/images/lman.png',
      'id':'1'
    },
    {
      'name':'Build muscle',
      'image':'assets/images/musman.png',
      'id':'2'
    },
    {
      'name':'Keep fit',
      'image':'assets/images/fman.png',
      'id':'3'
    }
   ];

  final controller = Get.put(Datacontroller() , permanent: true);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx , cont)=>SizedBox(
      height: cont.maxHeight,
      width: cont.maxWidth,
      child:GetBuilder<Datacontroller>(
        builder:(contr)=> Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
            width: cont.maxWidth,
          //  color: Colors.amber,
            height: cont.maxHeight*0.2,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 3),
            child:  Question( que: "What are your main goals ? " , subt: "",)
           ),
          ...(contr.man==2? goalsw:goalsm).map((e) =>InkWell(
            overlayColor: WidgetStatePropertyAll(Colors.white.withOpacity(0)),
            onTap: (){
              contr.setselectgoal(e['id']);
            },
            child: Container(
              height: cont.maxHeight*0.23,
              width: cont.maxWidth*0.85,
              margin:e['id']=='1'? const EdgeInsets.only(top: 0):const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                 gradient:(contr.selectgoal == e['id'])? LinearGradient(colors: [
                              contr.deepcolor.withOpacity(0.25),
                             const Color.fromARGB(255, 165, 213, 222).withOpacity(0.3),
                               Colors.black.withOpacity(0.2) 
                            ] ,
                            begin: Alignment.topLeft ,
                            end: Alignment.bottomRight
                            ):null,
                border: Border.all(
                  width: 1 ,
                  color: Colors.black54
                ),
                borderRadius: BorderRadius.circular(40)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 const Spacer(),
                   Text(e['name'] , style: const TextStyle(
                    fontFamily: Constans.fontFamily,
                    fontSize: 25 ,
                    color: Colors.black ,
                    fontWeight: FontWeight.w600
                  ),),
                  const Spacer(),
                  SizedBox(
                    width: cont.maxWidth*0.3,
                    height: cont.maxHeight*0.218,
                    child:e['id']=='3'? Image.asset(e['image'] , fit: BoxFit.contain,):Image.asset(e['image'] , fit: BoxFit.fitWidth,),
                  ),
                  const Spacer()
                ],
              ),
             ),
          ),
           ),
           ],
        ),
      )
    ));
  }
}