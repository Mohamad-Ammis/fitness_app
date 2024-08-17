import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/precontroller.dart';
import 'package:fitnessapp/controller/spec_day_controller.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/views/gym_pre/my_timeline_tile.dart';
import 'package:fitnessapp/views/gym_pre/rate.dart';
import 'package:fitnessapp/views/gym_pre/waveclipper.dart';
import 'package:fitnessapp/views/gym_pre/weekcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';


class Plan extends StatefulWidget {
   const Plan({super.key});

  @override
  State<Plan> createState() => _PlanState();
}

class _PlanState extends State<Plan> {
   final controller = Get.put(Precontroller(), permanent: true);

   final control = Get.put(SpecDay(),permanent: true);

   @override
   void initState() {
    try{
      controller.initrate(control.coachid);
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color:Colors.white,
          height: 1100,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: top(context)),
                Positioned(
                top:185 ,
                child:SizedBox(
                height: 855,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ListView(
                 shrinkWrap: true,
                 physics: const NeverScrollableScrollPhysics(),
                 children: [
                  Mytimelinetile(isfirst: true, islast: false, ispast: controller.checkplansweek1()  , textt: "WEEK 1",),
                  Mytimelinetile(isfirst: false, islast: false, ispast: controller.checkplansweek2(), textt: "WEEK 2",),
                  Mytimelinetile(isfirst: false, islast: false, ispast: controller.checkplansweek3(), textt: "WEEK 3",),
                  Mytimelinetile(isfirst: false, islast: false, ispast: controller.checkplansweek4(), textt: "WEEK 4",),
                  Mytimelinetile(isfirst: false, islast: true, ispast: false, textt: "END",),
                 ],
                ),
              ),
            ) ),
            Positioned(
                top:295 ,
                child:SizedBox(
                height: 855,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ListView(
                 shrinkWrap: true,
                 physics: const NeverScrollableScrollPhysics(),
                 children: [
                   Weekcard(week: controller.week1, ispast: controller.checkplansweek1()),
                   Weekcard(week: controller.week2, ispast: controller.checkplansweek2()),
                   Weekcard(week: controller.week3, ispast: controller.checkplansweek3()),
                   Weekcard(week: controller.week4, ispast: controller.checkplansweek4()),
                 ],
                ),
              ),
            ) ),
            Positioned(
                right: MediaQuery.of(context).size.width*0.11,
                top: 190,
                  child: SizedBox(
                    height: 40,
                    width: 200,
                    child: GetBuilder<Precontroller>(
                      init: Precontroller(),
                      builder:(contr)=> starrate(context, contr)),
                  )),

            ],
          ),
        ),
      )
    );
  }

  Widget top(BuildContext context) {
    return Stack(
            children: [
              SizedBox(
                height: 260,
                width: MediaQuery.of(context).size.width,
              ),
              ClipPath(
              clipper: WaveClipper(),
              child: Container(
              height: 230,
              width: MediaQuery.of(context).size.width,
              color: Colors.black87,
              child: Opacity(
                opacity: 0.4,
                child: Image.asset("assets/images/pick.jpg" , fit: BoxFit.cover,),
                ),
                      ),
              ),
              Positioned(
                left: 30,
                bottom:0,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70)
                  ),
                  elevation: 10,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: Colors.black
                    ),
                      borderRadius: BorderRadius.circular(70)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child:CachedNetworkImage(imageUrl:"${Constans.mainbaseUrlimage}uploads/${controller.image}",fit: BoxFit.cover,)
                    ),
                  ),
                )),
                  Positioned(
                    left: 10,
                    top: 30,
                    child: InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.black54,
                        ),
                        child:Icon(Icons.arrow_back_ios_new_rounded , color: Colors.white,size: 30,) ,
                      ),
                    ))
      
            ],
          );
  }

  InkWell starrate(BuildContext context, Precontroller contr) {
    return InkWell(
     onTap: (){
      if(userInfo!.getString("rate${control.coachid}")==null){
          showDialog(
    context: context, builder: (context)=>Ratedialg() );
      }else{
        showDialog(
            context: context,
            builder: (ctxx) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  title: const Text(
                    'Sorry',
                    style: TextStyle(
                        color: Color.fromARGB(255, 252, 93, 93), fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  content:const Text("You can rate only once"),
                ));
      }
  },
  child: Transform.scale(
    scale: 0.7,
    child: RatingBar.builder(
      initialRating: contr.rate,
      direction: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
      ignoreGestures: true, // تعيين هذه القيمة إلى true لمنع تغيير التقييم
    ),
  ),
);
  }
}