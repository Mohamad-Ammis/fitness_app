import 'package:fitnessapp/constans.dart';
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
      'name':'Diabetes',
      'image':'assets/images/ss.png',
      'id':'4'
    },
    {
      'name':'Blood pressure ',
      'image':'assets/images/dd.png',
      'id':'5'
    },
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
          ques(cont),
          allitem(cont, context, contr),
          lastitem(contr, context)
           ],
        ),
      )
    ));
 
  }

  Widget lastitem(Datacontroller contr, BuildContext context) {
    return Container(
    //  color: Colors.amber,
      child: InkWell(
                  overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                  onTap: (){
                      contr.setselectill(3);
                      },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    height:MediaQuery.of(context).size.height*0.18,
                    width:MediaQuery.of(context).size.width*0.45,
                    decoration: BoxDecoration(
                      gradient:(contr.checkill(3))? LinearGradient(colors: [
                              contr.deepcolor.withOpacity(0.25),
                             const Color.fromARGB(255, 165, 213, 222).withOpacity(0.3),
                               Colors.black.withOpacity(0.2)
                            ] ,
                            begin: Alignment.topLeft ,
                            end: Alignment.bottomRight
                            ):null,
                                border: Border.all(
                  width: 1 ,
                  color: Colors.black54),
                  borderRadius: BorderRadius.circular(40)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                        height: MediaQuery.of(context).size.height*0.11,
                        width: MediaQuery.of(context).size.width*0.27,
                        child: Image.asset("assets/images/tt.png",fit:BoxFit.contain,),
                        ),
                        const SizedBox(height: 5,),
                       const Text("shortness of breath",style: TextStyle(
                          fontFamily: Constans.fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 2,
                          color: Colors.black
                        ))
                      ],
                    ),
                  ),
                ),
    );
  }

  Container allitem(BoxConstraints cont, BuildContext context, Datacontroller contr) {
    return Container(
    //  color: Colors.pink,
      alignment: Alignment.topCenter,
          height: 355,
          width: cont.maxWidth,
          margin: const EdgeInsets.only(left: 20,right: 20 , top: 0 ),
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width*0.6,
              childAspectRatio: 1.05,
              mainAxisSpacing: 1,
              crossAxisSpacing: 20,
              ),
              children: 
              ill.map((item) => Container(
                 margin: EdgeInsets.only(bottom: 10),
                child: InkWell(
                  overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                  onTap: (){
                      contr.setselectill(int.parse(item['id']));
                      },
                  child: Container(
                    margin: const EdgeInsets.only(left: 5,right: 5,bottom: 0),
                    height:MediaQuery.of(context).size.height*0.16,
                    width:MediaQuery.of(context).size.width*0.4,
                    decoration: BoxDecoration(
                      gradient:(contr.checkill(int.parse(item["id"])))? LinearGradient(colors: [
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                        height: MediaQuery.of(context).size.height*0.12,
                        width: MediaQuery.of(context).size.width*0.27,
                        child: Image.asset(item["image"],fit:BoxFit.contain,),
                        ),
                        const SizedBox(height: 5,),
                        Text(item["name"],style: const TextStyle(
                          fontFamily: Constans.fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 2,
                          color: Colors.black
                        ))
                      ],
                    ),
                  ),
                ),
              )).toList()
              
              ),
        );
  }

  Container ques(BoxConstraints cont) {
    return Container(
          width: cont.maxWidth,
          height: cont.maxHeight*0.19,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 10),
          child:  Question( que: "Do you suffer from diseases  ? " , subt: "",)
         );
  }
}