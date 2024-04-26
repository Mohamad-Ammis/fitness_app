import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/auth_controller.dart';
import 'package:fitnessapp/views/auth_pages/login_page/login_page.dart';
import 'package:fitnessapp/widgets/custom_otp_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class VerificationPage extends StatelessWidget {
   VerificationPage({super.key});
  final authController=Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
   String email=authController.email.substring(0,2);
  final secret='*'*authController.email.substring(2,authController.email.length-10).length;
  email+=secret+authController.email.substring(authController.email.length-10);
    return GetBuilder<AuthController>(
      builder: (authController) {
        return Scaffold(
          appBar: AppBar(elevation: 0,scrolledUnderElevation: 0,),
          body:!authController.isLoading? Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Lottie.asset('assets/lottie/otp.json',width: 260),
                  SizedBox(height: 20,),
                  Text(
                    'Enter Verification Code',
                    style: TextStyle(fontSize: 38, fontFamily: Constans.fontFamily),
                  ),
                  Text(
                    'Enter code that we have sent to your email $email',
                    style: TextStyle(fontSize: 15, fontFamily: Constans.fontFamily),
                  ),
                  SizedBox(height: 30,),
                  CustomOtpField(onSubmit:  (String verificationCode) async {
                   authController.otpBorderColor = Colors.black;
                  authController.isLoading=true;
                  authController.update();
                  bool status =await authController.registerVerification(verificationCode, context);
                  authController.isLoading=false;
                  authController.update();
                  if(status){
                    authController.otpReadOnly=true;
                    authController.otpAutoFocuse=false;
                    Get.to(LogInPage());
                  }
                  else{
                    authController.otpBorderColor = Colors.red;
                    authController.update();
                  }
                }, readOnly: authController.otpReadOnly, autoFocus: authController.otpAutoFocuse, ),
                SizedBox(height: 10,)
                ,Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          'Resend Code?',
                          style: TextStyle(fontSize: 15, fontFamily: Constans.fontFamily,color: Constans.test),
                        ),
                    ],
                  ),
                ),
                ],
              ),
            ),
          ):const Center(child: CircularProgressIndicator()),
        );
      }
    );
  }
}
