//import 'package:fitnessapp/views/gym_pre/customclipperimage.dart';
import 'package:fitnessapp/views/gym_pre/rate.dart';
import 'package:fitnessapp/views/gym_pre/waveclipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class Plan extends StatelessWidget {
  const Plan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          top(context),
         /*  Expanded(
            child: Container(
              color: Colors.amber,
              child: Stepper(
        currentStep: 0, // يُمكن  أن  تُعيّن  `currentStep`  بِـ  0  لِـ  عرض  الخطوات  كلها
        steps: [
          Step(
            title: const Text('test 1'),
            content: const Text('contain'),
            isActive: true,
          ),
          Step(
            title: const Text('test 1'),
            content: const Text('contain'),
            isActive: true,
          ),
          Step(
            title: const Text('test 1'),
            content: const Text('contain'),
            isActive: true,
          ),
        ],
        onStepTapped: (step) {
          // يُمكن  أن  تُستخدم  هذه  الخاصية  لِـ  التحكم  في  الخطوة  المُختارة
          // لكن  لا  تُغير  الطريقة  القياسية  لِـ  `Stepper`
        },
        onStepContinue: () {
          // لا  يُستخدم  في  هذه  الحالة  لِـ  أن  الخطوات  مُفتوحة  دائمًا
        },
        onStepCancel: () {
          // لا  يُستخدم  في  هذه  الحالة  لِـ  أن  الخطوات  مُفتوحة  دائمًا
        },
      ),
            )) */
        ],
      ),
    );
  }

  Stack top(BuildContext context) {
    return Stack(
          children: [
            SizedBox(
              height: 280,
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
              bottom: 20,
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
                    child: Image.asset("assets/images/c2.jpg",fit: BoxFit.cover,),
                  ),
                ),
              )),
              Positioned(
              right: MediaQuery.of(context).size.width*0.11,
              bottom:55,
                child: SizedBox(
                  height: 40,
                  width: 200,
                  child: starRate(context),
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

  starRate(context) {
  return InkWell(
    onTap: (){
      showDialog(
      context: context, builder: (context)=>Ratedialg() );
    },
    child: Transform.scale(
      scale: 0.7,
      child: RatingBar.builder(
        initialRating: 0,
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