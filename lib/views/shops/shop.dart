import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>ZoomDrawer.of(context)!.toggle(), icon: const Icon(Icons.menu)),
        title: const Text("shop"),
      ),
    );
  }
}