import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/auth_controller.dart';
import 'package:fitnessapp/views/auth_pages/verfication_page/verfication_page.dart';
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
  GlobalKey<FormState> formKey = GlobalKey();

  var autovalidateMode = AutovalidateMode.disabled;
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            CustomTextField(
              enabledBorderColor: Colors.transparent,
              onChanged: (value) {
                authController.email = value;
              },
              isEmail: true,
              textStyle: const TextStyle(color: Colors.white),
              cursorColor: Constans.secondryColor,
              label: 'Email',
              labelStyle:
                  TextStyle(color: Constans.subTitleColor.withOpacity(0.5)),
              filled: true,
              fillColor: const Color(0xFF1F1E28),
              focusedBorderColor: Constans.secondryColor,
              
              suffixIcon: Icons.email,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              onChanged: (value) {
                authController.userName = value;
              },
              isUserName: true,
              textStyle: const TextStyle(color: Colors.white),
              cursorColor: Constans.secondryColor,
              label: 'Username',
              labelStyle:
                  TextStyle(color: Constans.subTitleColor.withOpacity(0.5)),
              filled: true,
              fillColor: const Color(0xFF1F1E28),
              focusedBorderColor: Constans.secondryColor,
              suffixIcon: Icons.person, enabledBorderColor: Colors.transparent,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomPasswordTextField(
              onChanged: (value) {
                authController.password = value;
              },
              textStyle: const TextStyle(color: Colors.white),
              cursorColor: Constans.secondryColor,
              label: 'Password',
              labelStyle:
                  TextStyle(color: Constans.subTitleColor.withOpacity(0.5)),
              filled: true,
              fillColor: const Color(0xFF1F1E28),
              focusedBorderColor: Constans.secondryColor, enabledBorderColor: Colors.transparent,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomPasswordTextField(
              onChanged: (value) {
                authController.confirmPassword = value;
              },
              textStyle: const TextStyle(color: Colors.white),
              cursorColor: Constans.secondryColor,
              label: 'Re password',
              labelStyle:
                  TextStyle(color: Constans.subTitleColor.withOpacity(0.5)),
              filled: true,
              fillColor: const Color(0xFF1F1E28),
              focusedBorderColor: Constans.secondryColor, enabledBorderColor: Colors.transparent,
            ),
            const SizedBox(
              height: 25,
            ),
            AuthCustomButton(
              buttonText: 'Register',
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  var response = await authController.register(
                      authController.userName,
                      authController.email,
                      authController.password,
                      authController.confirmPassword,
                      context);
                      if(response.statusCode>=200&&response.statusCode<300){
                  Get.to(VerificationPage());
                      }
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
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
