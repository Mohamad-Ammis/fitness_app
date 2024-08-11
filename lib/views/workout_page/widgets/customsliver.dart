import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/controller/exercontrol.dart';
import 'package:fitnessapp/controller/pickscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliverAppbarDelegate extends SliverPersistentHeaderDelegate{
final bool picks;  
final double expandedHeight ;
final String img ;
final String title ;
final String des ;
 CustomSliverAppbarDelegate({required this.expandedHeight , required this.img , required this.title , required this.des , required this.picks});
final datacont = Get.put(Datacontroller() , permanent: true);
final control = Get.put(Exercontroller() , permanent: true);
final pickcontroller = Get.put(Pickscotroller(),permanent: true);
@override
Widget build(BuildContext context , double shrinkOffset , bool overlapsContent){
  const size = 85;
  final top = expandedHeight - shrinkOffset - size / 2;
  return Stack(
   fit: StackFit.expand,
   children: [
    Container(
      height: MediaQuery.of(context).size.height*0.34 ,
      color: Colors.white,
    ),
    buildBackground(shrinkOffset, context),
    buildAppBar(shrinkOffset),
     Positioned(
          top: top - 40,
          left: 20,
          right: 20,
          child: buildFloating(shrinkOffset),
        ),
   ],
  );
}

 double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

 Widget buildBackground(double shrinkOffset , BuildContext context ) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Stack(
            children: [
              Container(
                color: Colors.black,
                height: /* MediaQuery.of(context).size.height*0.27 */ expandedHeight-40,
                width: MediaQuery.of(context).size.width,
                child: Opacity(
                  opacity: 0.6,
                  child:picks==false?CachedNetworkImage(imageUrl:"${Constans.mainbaseUrlimage}uploads/$img", fit: BoxFit.cover,):
                  Image.asset(img, fit: BoxFit.cover,)
                  )),
                Positioned(
                  left: 0,
                  bottom: 60,
                  child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 10),
                  height: MediaQuery.of(context).size.height * 0.13,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        title,
                        style:  TextStyle(fontSize: MediaQuery.of(context).size.width*0.065, color: Colors.white ,
                        fontFamily: Constans.fontFamily,
                         fontWeight: FontWeight.bold),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.71,
                        child: Text(
                          textAlign: TextAlign.left,
                          des,
                          style:  TextStyle(
                          fontFamily: Constans.fontFamily,
                          fontSize: MediaQuery.of(context).size.width*0.03,
                          color: Colors.white,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                ),)
            ],
          ),
      );

  Widget buildAppBar(double shrinkOffset) => Opacity(
        opacity: appear(shrinkOffset),
        child: AppBar(
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: const Icon(Icons.arrow_back , color: Colors.white,)),
          backgroundColor: /* Colors.black */const Color.fromARGB(255, 38, 164, 170),
          title: Text(title, style:const TextStyle(
            fontFamily: Constans.fontFamily,
            fontSize: 25,
            color: Colors.white,
          ),),
        //  centerTitle: true,
        ),
      );

 Widget buildFloating(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: SizedBox(
          height: 80,
          child: Card(
            color: const Color.fromARGB(206, 0, 0, 0)/* Color.fromARGB(206, 38, 163, 170) */,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: buildButton(text:picks==false? '${control.time} S':'${pickcontroller.time} S', icon: Icons.timer_sharp)),
                  Expanded(child: buildButton(text:picks==false? '${control.numexer} Exe':'${pickcontroller.numexer} Exe', icon: null)),
                  Expanded(child: buildButton(text:picks==false? '${control.calories} cal':'${pickcontroller.calories} cal', icon: Icons.local_fire_department_sharp)),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildButton({
    required String text,
    required IconData? icon,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
        icon==null? Container():  Icon(icon , color: Colors.white,),
          const SizedBox(width:4 ),
          Text(text, style: const TextStyle(fontSize: 21 , fontFamily: Constans.fontFamily, color: Colors.white )),
        ],
      );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight+30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

}