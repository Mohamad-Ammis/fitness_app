import 'package:fitnessapp/views/data_page/datawidget/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/datacont.dart';

// ignore: must_be_immutable
class Illness extends StatelessWidget {
   Illness({super.key});
   
  List ill =[
    {
      'name':'Knee pain',
      'image':'assets/images/rrr.png',
      'id':'1'
    },
    {
      'name':'Heart diseases',
      'image':'assets/images/kk.png',
      'id':'2'
    },
    {
      'name':'shortness of breath',
      'image':'assets/images/tt.png',
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
            height: cont.maxHeight*0.2,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 10),
            child:  Question( que: "Do you suffer from diseases  ? " , subt: "",)
           ),
          ...ill.map((e) =>InkWell(
            overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
            onTap: (){
              contr.setselectill(int.parse(e['id']));
            },
            child: Container(
              height: cont.maxHeight*0.23,
              width: cont.maxWidth*0.85,
              margin:e['id']=='1'? const EdgeInsets.only(top: 0):const EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                 gradient:(contr.checkill(int.parse(e["id"])))? LinearGradient(colors: [
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
                   Container(
                    width: cont.maxWidth*0.4,
                     child: Text(e['name'] , style: const TextStyle(
                      fontFamily: "WorkSans",
                      fontSize: 25 ,
                      color: Colors.black ,
                      fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,),
                   ),
                  const Spacer(),
                  SizedBox(
                    width: cont.maxWidth*0.3,
                    height: cont.maxHeight*0.218,
                    child:e['id']=='1'? Image.asset(e['image'] , fit: BoxFit.fitWidth,):Image.asset(e['image'] , fit: BoxFit.contain,),
                  ),
                  const Spacer()
                ],
              ),
             ),
          ),
           ).toList(),
           ],
        ),
      )
    ));
 
  }
}