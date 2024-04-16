
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomCurvedNavigationBar extends StatelessWidget {
  const CustomCurvedNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
     color: Colors.black,
     backgroundColor: Colors.white,
     items: const <Widget>[
       Icon(
         Icons.add,
         size: 30,
         color: Colors.white,
       ),
       Icon(
         Icons.list,
         size: 30,
         color: Colors.white,
       ),
       Icon(
         Icons.compare_arrows,
         size: 30,
         color: Colors.white,
       ),
     ],
     onTap: (index) {
       //Handle button tap
     },
                );
  }
}