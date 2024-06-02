import 'package:fitnessapp/controller/datacont.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/models/menuItem.dart';
import 'package:fitnessapp/models/menuitems.dart';
import 'package:fitnessapp/views/on_boarding/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menupage extends StatelessWidget {
  final Menuitem currentitem ;
  final ValueChanged<Menuitem> onselecteditem ;
    Menupage({super.key ,
   required this.currentitem ,
   required this.onselecteditem
   });
  
   final controller = Get.put(Datacontroller() , permanent: true);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: Stack(
          children:[ 
            Opacity(
              opacity:  0.6 ,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width:MediaQuery.of(context).size.width ,
                child: Image.asset("assets/images/b4.jpg" , fit: BoxFit.cover,),
              ),
            ),
            Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const Spacer(flex: 4,),
              ...Menuitems.all.map((item) =>ListTileTheme(
                selectedTileColor: Color.fromARGB(255, 58, 76, 77),
                selectedColor:Colors.black/* Color.fromARGB(255, 130, 218, 223) */,
                child: ListTile(
                 // selectedTileColor: Colors.black,
                 // splashColor: Colors.black,
                  style:ListTileStyle.drawer ,
                  selected: item == currentitem,
                  leading: Icon(item.icon , size:item == currentitem? 40:30,),
                  title: Text(item.title , style:item == currentitem?  TextStyle(
                    fontSize:MediaQuery.of(context).size.width*0.06,
                    fontFamily: "WorkSans",
                    fontWeight: FontWeight.bold
                  ): TextStyle(
                    fontSize: MediaQuery.of(context).size.width*0.055,
                    fontFamily: "WorkSans",
                  )),
                  onTap: ()=>onselecteditem(item),
                ),
              ) ,).toList(),
              SizedBox(height: 200,),
             Container(
              margin: EdgeInsets.only(left: 20),
              padding: EdgeInsets.symmetric(horizontal: 20 ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: Colors.black
                ),
                borderRadius: BorderRadius.circular(40)
              ),
               child: TextButton(onPressed: (){
                preference!.clear();
                controller.setlogout();
                Get.offAll(OnBoarding());
               },
                child: Text("Logout" , style: TextStyle(
                  color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width*0.05,
                      fontFamily: "WorkSans",
                    )) ),
             ),
             
             const Spacer(flex: 2,),
            ],
          ),]
        ),
      ),
    );
  }
}