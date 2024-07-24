import 'package:fitnessapp/controller/precontroller.dart';
import 'package:fitnessapp/models/dayplan.dart';
import 'package:fitnessapp/views/gym_pre/foodpart.dart';
import 'package:fitnessapp/views/gym_pre/sportpart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dayplanpage extends StatefulWidget {
   final Dayplan d ;
  const Dayplanpage({super.key ,required this.d});

  @override
  State<Dayplanpage> createState() => _DayplanpageState();
}

class _DayplanpageState extends State<Dayplanpage> {
final controller = Get.put(Precontroller(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: Icon(Icons.arrow_back_ios , size: 24, color: Colors.white,)),
          title: Text("Week ${controller.getweek(widget.d)} , day ${widget.d.day} " ,textAlign: TextAlign.center, style: TextStyle(
            fontSize: 25,
            color: Colors.white
          ), ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 50, 144, 173),
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 92),
            child: TabBar(
              labelPadding: EdgeInsets.only(bottom: 4),
              labelStyle: TextStyle(fontSize: 15),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black54,
              indicatorColor: Colors.white,
              padding: EdgeInsets.only(top: 10),
              overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
              dividerHeight: 0,
              tabs: [
                Tab(
                  icon:Icon( Icons.sports_gymnastics_rounded , color: Colors.white,size: 30,),
                  text: "Exercise",
                ),
                Tab(
                  icon:Icon( Icons.fastfood , color: Colors.white,size: 30,),
                   text: "Meals",
                )
              ]),
          ),
        ),
        body: TabBarView(children: [
           Sportpart(id: widget.d.id,),
           Foodpart(id: widget.d.id)
        ]),
      ),
    );
  }
}