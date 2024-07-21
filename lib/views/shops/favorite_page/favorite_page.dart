import 'package:fitnessapp/views/shops/favorite_page/widgets/favorite_page_card.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F4F6),
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: ListView.builder(
          itemBuilder: (context, index) => const FavoritePageCard(),
        ),
      ),
    );
  }
}

