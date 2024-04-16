import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/auth_pages/widgets/auth_custom_button.dart';
import 'package:fitnessapp/views/auth_pages/widgets/auth_footer.dart';
import 'package:fitnessapp/views/workout_page/workout_page.dart';
import 'package:fitnessapp/widgets/Custom_text_field.dart';
import 'package:fitnessapp/widgets/custom_pass_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
  });
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          CustomTextField(
            isEmail: true,
            textStyle: const TextStyle(color: Colors.white),
            cursorColor: Constans.secondryColor,
            label: 'Email',
            labelStyle:
                TextStyle(color: Constans.subTitleColor.withOpacity(0.5)),
            filled: true,
            fillColor: const Color(0xFF1F1E28),
            focusedBorderColor: Constans.secondryColor,
            suffixIcon: Icons.email_outlined,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomPasswordTextField(
            textStyle: const TextStyle(color: Colors.white),
            cursorColor: Constans.secondryColor,
            label: 'Password',
            labelStyle:
                TextStyle(color: Constans.subTitleColor.withOpacity(0.5)),
            filled: true,
            fillColor: const Color(0xFF1F1E28),
            focusedBorderColor: Constans.secondryColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {},
                  child: const Text("Forget password ?",
                      style: TextStyle(color: Constans.secondryColor))),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: AuthCustomButton(
              buttonText: 'Login',
              onTap: () {
                Get.offAll(WorkoutPage());
                if (formKey.currentState!.validate()) {
                  print('validate');
                }
              },
            ),
          ),
          AuthFooter(
            titleText: 'Don\'t have an account ?',
            specialWord: 'Register',
            onPressed: () {
              Get.offAllNamed('/register');
            },
          )
        ],
      ),
    );
  }
}
