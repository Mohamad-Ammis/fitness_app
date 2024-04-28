import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/auth_pages/login_page/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginInfoBody extends StatelessWidget {
  const LoginInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome!",
            style: TextStyle(
                color: Constans.secondryColor,
                fontSize: 40,
                fontFamily: Constans.fontFamily,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          LoginForm(),
          SizedBox(
            height: 5,
          ),
          
        ],
      ),
    );
  }
}

