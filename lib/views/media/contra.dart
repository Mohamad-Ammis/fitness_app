import 'package:flutter/material.dart';

class Contra extends StatefulWidget {
  const Contra({super.key});

  @override
  State<Contra> createState() => _ContraState();
}

class _ContraState extends State<Contra> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
