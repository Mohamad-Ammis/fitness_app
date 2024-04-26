import 'package:fitnessapp/models/menuItem.dart';
import 'package:fitnessapp/models/menuitems.dart';
import 'package:flutter/material.dart';

class Menupage extends StatelessWidget {
  final Menuitem currentitem ;
  final ValueChanged<Menuitem> onselecteditem ;
   const Menupage({super.key ,
   required this.currentitem ,
   required this.onselecteditem
   });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: Stack(
          children:[ 
            Opacity(
              opacity: 0.6,
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
            const Spacer(flex: 2,),
              ...Menuitems.all.map((item) =>ListTileTheme(
                selectedColor:Colors.black,
                child: ListTile(
                  splashColor: Colors.white.withOpacity(0),
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
             const Spacer(flex: 3,),
              Container()
            ],
          ),]
        ),
      ),
    );
  }
}