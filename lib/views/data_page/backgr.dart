import 'package:flutter/material.dart';

class Back extends StatelessWidget {
  const Back({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04  , left: 0),
                  alignment: Alignment.centerLeft,
                  height: 200,
                  width: 120,
                  decoration:  BoxDecoration(
                    color:const Color.fromARGB(255, 99, 226, 233).withOpacity(0.17) ,
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(100) , bottomRight:Radius.circular(100) )
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  margin: const EdgeInsets.only(left: 150 , right: 10 ),
                  decoration: BoxDecoration(
                    color:const Color(0xff9db0ce).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(60)
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 Container(
                  height: 70,
                  width: 70,
                  margin: const EdgeInsets.only(  right: 170 ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 165, 213, 222).withOpacity(0.18),
                    borderRadius: BorderRadius.circular(60)
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20  ),
                  alignment: Alignment.centerLeft,
                  height: 200,
                  width: 120,
                  decoration:  BoxDecoration(
                    color:Color.fromARGB(255, 23, 83, 86).withOpacity(0.13),
                    borderRadius:const BorderRadius.only(topLeft: Radius.circular(100) , bottomLeft:Radius.circular(100) )
                  ),
                ),
                
              ],
            ),
               ),
               Container(
                  height: 80,
                  width: 80,
                  margin: const EdgeInsets.only(left: 150 ),
                  decoration: BoxDecoration(
                    color:const Color(0xff9db0ce).withOpacity(0.16),
                    borderRadius: BorderRadius.circular(60)
                  ),
                ),
               Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                  height: 100,
                  width: 120,
                  decoration: BoxDecoration(
                    color:const Color.fromARGB(255, 99, 226, 233).withOpacity(0.2),
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(200))
                  ),
                )
                ],
               ),)
          ],
        ),
      );
  }
}