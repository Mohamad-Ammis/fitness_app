import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
      @override
      Path getClip(Size size) {
        var path = new Path();
        path.lineTo(
            0, size.height); 
    
        var firstStart = Offset(size.width / 5, size.height);
       
        var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
       
        path.quadraticBezierTo(
            firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    
        var secondStart =
            Offset(size.width - (size.width / 3.24), size.height - 105);
   
        var secondEnd = Offset(size.width, size.height - 10);
  
        path.quadraticBezierTo(
            secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    
        path.lineTo(
            size.width, 0);
        path.close();
        return path;
      }
    
      @override
      bool shouldReclip(CustomClipper<Path> oldClipper) {
        return false; //if new instance have different instance than old instance
        //then you must return true;
      }
      }