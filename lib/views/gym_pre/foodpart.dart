import 'dart:async';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/spec_day_controller.dart';
import 'package:fitnessapp/shimmer/shimmergym.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Foodpart extends StatefulWidget {
  final int id ;
  const Foodpart({super.key , required this.id});

  @override
  State<Foodpart> createState() => _FoodpartState();
}

class _FoodpartState extends State<Foodpart> {
  
 final controller = Get.put(SpecDay(), permanent: true);
 bool isloading = false ;
@override
  void initState() {
    Timer(const Duration(milliseconds: 0), () async{ 
       if(controller.load==0){
        setState(() {
        isloading = true;
      });
      try{
       controller.setspecday("snack");
       await controller.getmeal();
       controller.setspecday("breakfast");
       await controller.getmeal();
      controller.setspecday("lunch");
      await controller.getmeal();
      controller.setspecday("dinner");
      await controller.getmeal();
      controller.updateload();
      }catch(error){
         showDialog(
            context: context,
            builder: (ctxx) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  title: const Text(
                    'Warning',
                    style: TextStyle(
                        color: Color.fromARGB(255, 252, 93, 93), fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  content: Text(error.toString()),
                ));
      }
      setState(() {
        isloading = false;
      });

       }
    });
     super.initState();
  }

 
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context , contr)=>isloading==false? ListView(
      children: [
        title("assets/images/bf.png","Breakfast"),
        brakfast(contr),
       const SizedBox(height: 10,),
        title("assets/images/snack.png","Snacks"),
        snack(contr),
        title("assets/images/lunch.png","Lunch"),
        lunch(contr),
        title("assets/images/dinner.png","Dinner"),
        dinner(contr)

      ],
    ):ListView(
       children: [
        title("assets/images/bf.png","Breakfast"),
        loadbrakfast(contr),
       const SizedBox(height: 10,),
        title("assets/images/snack.png","Snacks"),
        loadsnack(contr),
        title("assets/images/lunch.png","Lunch"),
        loadlunch(contr),
      ],
    ));
  }







  ListView dinner(BoxConstraints contr) {
    return ListView(
        physics:const NeverScrollableScrollPhysics(),
        primary: false,
        shrinkWrap: true,
        children: controller.dinner.map((meal) => InkWell(
          overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
          onTap: () {},
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin:const EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
                height: 120,
                width: contr.maxWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black,
                ),
                child: Opacity(
                  opacity:0.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child:Image.network("http://${Constans.host}:8000/uploads/${meal.image!}", fit: BoxFit.cover,),
                  ),
                   ),
              ),
              Text(meal.name!, style:const TextStyle(
                fontFamily: "WorkSans",
                fontSize: 22 ,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),)
            ],
          ),
        )).toList(),
       );
  }

  Container lunch(BoxConstraints contr) {
    return Container(
      margin:const EdgeInsets.only(left: 8),
        height: 220,
        width: contr.maxWidth,
        alignment: Alignment.center,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: controller.lunch.map((meal) => InkWell(
            overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
            onTap: () {},
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 215,
                  width: contr.maxWidth*0.85,
                  margin: EdgeInsets.symmetric(horizontal: contr.maxWidth*0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network("http://${Constans.host}:8000/uploads/${meal.image!}", fit: BoxFit.cover,),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: contr.maxWidth*0.85,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius:const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)
                      ),
                      color: Colors.black.withOpacity(0.7)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10 , top: 4 , bottom: 6),
                          child: Text(meal.name!, style:const TextStyle(
                            fontFamily: "WorkSans",
                            fontSize: 19 ,
                            color: Colors.white
                          ),),
                        ),
                        Row(
                          children: [
                           const Spacer(),
                            Text(meal.calories! ,style:const TextStyle(
                            fontFamily: "WorkSans",
                            fontSize: 19 ,
                            color: Colors.white
                          ), ),
                         const SizedBox(width: 10,),
                          const Icon(Icons.local_fire_department_rounded , size: 25 , color: Colors.white,),
                          const  Spacer(),
                            Text(meal.protein! ,style:const TextStyle(
                            fontFamily: "WorkSans",
                            fontSize: 19 ,
                            color: Colors.white
                          ), ),
                         const SizedBox(width: 10,),
                          const Icon(Icons.lunch_dining_rounded , size: 25 , color: Colors.white,),
                          const  Spacer(),
                          ],
                        )
                      ],
                    ),
                  ))
              ],
            ),
          )).toList(),
        ),
      );
  }

  SizedBox snack(BoxConstraints contr) {
    return SizedBox(
        height: 150,
        width: contr.maxWidth,
        child: ListView(
        scrollDirection: Axis.horizontal,
        children: controller.snack.map((meal) => Container(
          margin:const EdgeInsets.symmetric(horizontal: 10),
          height: 145,
          width: contr.maxWidth*0.55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: InkWell(
            overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network("http://${Constans.host}:8000/uploads/${meal.image!}", fit: BoxFit.cover,),
            ),
          ),
        )).toList(),
      ),
      );
  }

  Container brakfast(BoxConstraints contr) {
    return Container(
        alignment: Alignment.center,
        height: 100,
        width: contr.maxWidth,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: controller.breakfast.map((meal) => InkWell(
            overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
            onTap: () {},
            child: Container(
              height: 100,
              width: contr.maxWidth*0.285,
              margin:const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(25),
               border: Border.all(
                width: 0.2,
                color: Colors.black87
               )
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network("http://${Constans.host}:8000/uploads/${meal.image!}", fit: BoxFit.cover,),
              ),
            ),
          )).toList(),
        ),
      );
  }

  Padding title(String img , String name ) {
    return Padding(
        padding: const EdgeInsets.only(top: 10 , bottom: 13 , left: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: Image.asset(img , fit: BoxFit.cover,),
            ),
           const SizedBox(width: 15,),
             Text(name , style:const TextStyle(
             fontFamily: "WorkSans",
             fontWeight: FontWeight.bold,
            fontSize: 22 ,
            color: Colors.black
          ),),
          ],
        ),
      );
  }
  
  Widget loadbrakfast(BoxConstraints contr){
    return Container(
        alignment: Alignment.center,
        height: 100,
        width: contr.maxWidth,
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder:(cont  , ind)=> Container(
            height: 100,
            width: contr.maxWidth*0.285,
            margin:const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(25),
            ),
            child: Shimmergym.Rectangle(height: 100,
            width: contr.maxWidth*0.285,radius: 25)
          ))
      );
  }

 SizedBox loadsnack(BoxConstraints contr) {
    return SizedBox(
        height: 150,
        width: contr.maxWidth,
        child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder:(cont  , ind) => Container(
          margin:const EdgeInsets.symmetric(horizontal: 10),
          height: 145,
          width: contr.maxWidth*0.55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Shimmergym.Rectangle( height: 145,
          width: contr.maxWidth*0.55,radius: 30)
        ))
      );
  }

Container loadlunch(BoxConstraints contr) {
    return Container(
      margin:const EdgeInsets.only(left: 8),
        height: 220,
        width: contr.maxWidth,
        alignment: Alignment.center,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (cont  , ind) => Container(
            height: 215,
            width: contr.maxWidth*0.85,
            margin: EdgeInsets.symmetric(horizontal: contr.maxWidth*0.05),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Shimmergym.Rectangle(height: 215,
            width: contr.maxWidth*0.85,
                        radius: 30)
            ),
          ))
      );
      }


}