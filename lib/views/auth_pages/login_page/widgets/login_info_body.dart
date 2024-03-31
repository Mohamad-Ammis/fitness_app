import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/auth_pages/login_page/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginInfoBody extends StatelessWidget {
  const LoginInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Welcome!",
            style: TextStyle(
                color: Constans.secondryColor,
                fontSize: 40,
                fontFamily: Constans.fontFamily,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          LoginForm(),
          const SizedBox(
            height: 5,
          ),
          
        ],
      ),
    );
  }
}

