import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/auth_pages/widgets/auth_custom_button.dart';
import 'package:fitnessapp/views/auth_pages/widgets/auth_footer.dart';
import 'package:fitnessapp/widgets/Custom_text_field.dart';
import 'package:fitnessapp/widgets/custom_pass_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RegisterPageForm extends StatefulWidget {
  const RegisterPageForm({super.key});

  @override
  State<RegisterPageForm> createState() => _RegisterPageFormState();
}

class _RegisterPageFormState extends State<RegisterPageForm> {
  GlobalKey<FormState>formKey=GlobalKey();

  var autovalidateMode= AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
        child: Column(
      children: [
        CustomTextField(
          isEmail: true,
          textStyle: const TextStyle(color: Colors.white),
          cursorColor: Constans.secondryColor,
          label: 'Email',
          labelStyle: TextStyle(color: Constans.subTitleColor.withOpacity(0.5)),
          filled: true,
          fillColor: const Color(0xFF1F1E28),
          focusedBorderColor: Constans.secondryColor,
          suffixIcon: Icons.email,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTextField(
          isUserName: true,
          textStyle: const TextStyle(color: Colors.white),
          cursorColor: Constans.secondryColor,
          label: 'Username',
          labelStyle: TextStyle(color: Constans.subTitleColor.withOpacity(0.5)),
          filled: true,
          fillColor: const Color(0xFF1F1E28),
          focusedBorderColor: Constans.secondryColor,
          suffixIcon: Icons.person,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomPasswordTextField(
          textStyle: const TextStyle(color: Colors.white),
          cursorColor: Constans.secondryColor,
          label: 'Password',
          labelStyle: TextStyle(color: Constans.subTitleColor.withOpacity(0.5)),
          filled: true,
          fillColor: const Color(0xFF1F1E28),
          focusedBorderColor: Constans.secondryColor,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomPasswordTextField(
          textStyle: const TextStyle(color: Colors.white),
          cursorColor: Constans.secondryColor,
          label: 'Re password',
          labelStyle: TextStyle(color: Constans.subTitleColor.withOpacity(0.5)),
          filled: true,
          fillColor: const Color(0xFF1F1E28),
          focusedBorderColor: Constans.secondryColor,
        ),
        const SizedBox(
          height: 25,
        ),
        AuthCustomButton(
          buttonText: 'Register',
          onTap: () {
            if(formKey.currentState!.validate()){
              print('validate');
            }
            else{
              setState(() {
              autovalidateMode= AutovalidateMode.always;
                
              });
            }
          },
        ),
        //SizedBox(height: 5,),
        AuthFooter(
          titleText: 'Already have an account ?',
          specialWord: 'Login',
          onPressed: () {
            Get.offAllNamed('/login');
          },
        )
      ],
    ));
  }
}
