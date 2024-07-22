import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/auth_controller.dart';
import 'package:fitnessapp/views/auth_pages/forgot_password/widgets/verfication_code.dart';
import 'package:fitnessapp/views/auth_pages/widgets/auth_custom_button.dart';
import 'package:fitnessapp/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailPage extends StatelessWidget {
  EmailPage({super.key});
  final authController=Get.put(AuthController());
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GetBuilder<AuthController>(
          builder: (authController) {
            return SingleChildScrollView(
              child: Form(
                key: formKey,
                    autovalidateMode: authController.autovalidateMode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Forgot Password',
                      style: TextStyle(
                          fontFamily: Constans.fontFamily,
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Please enter your email to reset the password',
                      style: TextStyle(
                          color: Color(0xFF989898),
                          fontFamily: Constans.fontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      onChanged: (value) {
                        authController.email=value;
                      },
                      isEmail: true,
                      textStyle: const TextStyle(),
                      cursorColor: Colors.black,
                      label: 'Email',
                      labelStyle: const TextStyle(color: Color(0xFF989898),),
                      filled: true,
                      fillColor: Constans.subTitleColor,
                      focusedBorderColor: Colors.black,
                      enabledBorderColor: const Color(0xFFE1E1E1),
                      suffixIcon: null,
                    ),
                    const SizedBox(height: 20,),
                    AuthCustomButton(
                      backgroundColor: Constans.test2,
                      titleColor: Colors.white,
                      width: MediaQuery.sizeOf(context).width,
                      borderRadius: 12,
                      buttonText: const Text(
          'Reset Password',
          style:   TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
        ),
                      onTap: ()  async {
                        if (formKey.currentState!.validate()) {
                          var response=await authController.forgotPassword(authController.email, context);
                          if(response.statusCode>=200&&response.statusCode<300){
                        Get.to(ForgotVerificationCode());
                          }
                          authController.autovalidateMode=AutovalidateMode.disabled;
                        }
                        else{
                          authController.autovalidateMode=AutovalidateMode.always;
                          authController.update();
                        }
                        
                      },
                    ),
                    
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
