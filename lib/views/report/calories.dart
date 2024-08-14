import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/report/circleprogress.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Calories extends StatefulWidget {
  final int calories ;
  final int totalcalories ;
  const Calories({super.key,
  required this.calories,
  required this.totalcalories
  });

  @override
  State<Calories> createState() => _CaloriesState();
}

class _CaloriesState extends State<Calories> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 7, right: 7, top: 7, bottom: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.only(left: 10, top: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Calories",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: Constans.fontFamily,
                      fontSize: 20)
                ),
                const Spacer(),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color:const Color.fromARGB(255, 235, 67, 98),
                      borderRadius: BorderRadius.circular(30)),
                  margin: const EdgeInsets.only(right: 12, top: 4),
                  child: const Icon(
                    Icons.local_fire_department_sharp,
                    size: 20,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Circleprogress(
                  color: Constans.test,
                  red: 58,
                  width: 10,
                  wid:  SizedBox(
                    height: 70,
                    width: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.calories.toString(),
                          style: TextStyle(
                            color: Color.fromARGB(255, 235, 67, 98),
                            fontWeight: FontWeight.bold,
                            fontFamily: Constans.fontFamily,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "from",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: Constans.fontFamily,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          widget.totalcalories.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 235, 67, 98),
                            fontFamily: Constans.fontFamily,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  per: widget.calories / widget.totalcalories,
                  colors:const [
                    Color(0xffF26680),
                    Color(0xffE03741), 
                  ],
                  ),
            )
          ],
        ),
      ),
    );
  }
}
