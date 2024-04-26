import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class Food extends StatelessWidget {
  const Food({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>ZoomDrawer.of(context)!.toggle(), icon: Icon(Icons.menu)),
        title: Text("food"),
      ),
    );
  }
}