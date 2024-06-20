import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Ratedialg extends StatefulWidget {
  const Ratedialg({super.key});

  @override
  State<Ratedialg> createState() => _RatedialgState();
}

class _RatedialgState extends State<Ratedialg> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ),
      child: Container(
        height: 400,
        width: MediaQuery.of(context).size.width*0.85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              height: 80,
              width: MediaQuery.of(context).size.width*0.85,
              alignment: Alignment.center,
              child: Image.asset("assets/images/star.png" , fit: BoxFit.contain,),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.85,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 15 , left: 15 , right: 15),
              child: Text("We are working hard for a better user experience." , style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                color: Colors.black,
                fontFamily: "WorkSans",
              ),
              textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.85,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 0, left: 15 , right: 15),
              child: Text("We'd greatly appreciate if you can rate us ." , style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                color: Colors.black,
                fontFamily: "WorkSans",
              ),
              textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 70,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width*0.85,
             // color: Colors.amber,
              child: customIconRate(),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              height: 60,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 204, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),),),
                    child: childbutton("RATE", 50, 110, 5, 18)),)
          ],
        ),
      ),
    );
  }
  
  customIconRate() {
    return RatingBar.builder(
      initialRating: 0,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 5),
      itemBuilder: ((context, index) {
        switch (index) {
          case 0:
            return const Icon(
              Icons.sentiment_very_dissatisfied,
              color: Colors.redAccent,
            );
          case 1:
            return const Icon(
              Icons.sentiment_dissatisfied,
              color: Colors.redAccent,
            );
          case 2:
            return const Icon(
              Icons.sentiment_neutral,
              color: Colors.amber,
            );
          case 3:
            return const Icon(
              Icons.sentiment_satisfied,
              color: Colors.lightGreen,
            );
          case 4:
            return const Icon(
              Icons.sentiment_very_satisfied,
              color: Colors.green,
            );
          default:
            return const Icon(Icons.sentiment_neutral);
        }
      }),
      onRatingUpdate: (rating) => debugPrint(rating.toString()),
    );
  }

  Container childbutton(
      String s, double height, double width, double hori, double font) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: hori, vertical: 8),
      height: height,
      width: width,
      child: Text(
        s,
        style: TextStyle(
            fontFamily: "WorkSans",
            fontSize: font,
           // fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    );
  }



}