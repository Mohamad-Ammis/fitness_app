import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/auth_controller.dart';
import 'package:fitnessapp/views/auth_pages/login_page/login_page.dart';
import 'package:fitnessapp/views/auth_pages/widgets/auth_custom_button.dart';
import 'package:fitnessapp/widgets/custom_pass_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
  final authController = Get.put(AuthController());
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GetBuilder<AuthController>(builder: (authController) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: authController.autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Set a new password',
                    style: TextStyle(
                        fontFamily: Constans.fontFamily,
                        fontSize: 28,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Create a new password. Ensure it differs from previous ones for security',
                    style: TextStyle(
                        color: Color(0xFF989898),
                        fontFamily: Constans.fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomPasswordTextField(
                    suffixIconColor: Colors.black,
                    onChanged: (value) {
                      authController.password = value;
                    },
                    textStyle: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    label: 'Password',
                    labelStyle: const TextStyle(color: Color(0xFF989898)),
                    filled: false,
                    fillColor: const Color(0xFF1F1E28),
                    focusedBorderColor: Colors.black,
                    enabledBorderColor: const Color(0xFFE1E1E1),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomPasswordTextField(
                    suffixIconColor: Colors.black,
                    onChanged: (value) {
                      authController.confirmPassword = value;
                    },
                    textStyle: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    label: 'Re password',
                    labelStyle: const TextStyle(color: Color(0xFF989898)),
                    filled: false,
                    fillColor: const Color(0xFF1F1E28),
                    focusedBorderColor: Colors.black,
                    enabledBorderColor: const Color(0xFFE1E1E1),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  AuthCustomButton(
                    backgroundColor: Constans.test2,
                    titleColor: Colors.white,
                    width: MediaQuery.sizeOf(context).width,
                    borderRadius: 12,
                    buttonText: 'Update Password',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        var response = await authController.resetPassword(
                            authController.email,
                            authController.verificationCode,
                            authController.password,
                            authController.confirmPassword,
                            context);
                            if(response.statusCode>=200&&response.statusCode<300){
                              Get.offAll(const LogInPage());
                            }
                        authController.autovalidateMode =
                            AutovalidateMode.disabled;
                      } else {
                        authController.autovalidateMode =
                            AutovalidateMode.always;
                        authController.update();
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
    
  }
}
