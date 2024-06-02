import 'package:flutter/material.dart';

class Warning extends StatelessWidget {
  final String warn ;
  const Warning({super.key , required this.warn });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  title: const Text(
                    'Warning',
                    style: TextStyle(
                        color: Color.fromARGB(255, 252, 93, 93), fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  content: Text(warn),
                );
  }
}