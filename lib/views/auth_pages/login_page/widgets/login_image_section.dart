
import 'package:fitnessapp/utils/app_images.dart';
import 'package:flutter/material.dart';

class LoginImageSection extends StatelessWidget {
  const LoginImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height / 2 - 100,
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.8,
          //colorFilter: ColorFilter.mode(Color.fromARGB(153, 0, 0, 0), BlendMode.color),
          image: AssetImage(
            Assets.imagesLoginFitMan,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
