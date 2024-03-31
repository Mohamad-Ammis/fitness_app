import 'package:fitnessapp/utils/app_images.dart';
import 'package:fitnessapp/views/auth_pages/register_page/widgets/register_page_body.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesRegisterMan),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.softLight)),
        ),
        child:const RegisterPageBody(),
      ),
    );
  }
}
