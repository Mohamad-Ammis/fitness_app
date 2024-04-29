import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/auth_controller.dart';
import 'package:fitnessapp/views/auth_pages/forgot_password/widgets/reset_pass.dart';
import 'package:fitnessapp/widgets/custom_otp_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotVerificationCode extends StatelessWidget {
  ForgotVerificationCode({super.key});
  final authController = Get.put(AuthController());
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    String email = authController.email.substring(0, 2);
    final secret = '*' *
        authController.email
            .substring(2, authController.email.length - 10)
            .length;
    email += secret +
        authController.email.substring(authController.email.length - 10);
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
                    'Check your email',
                    style: TextStyle(
                        fontFamily: Constans.fontFamily,
                        fontSize: 28,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'We sent a reset code to $email enter 6 digit code that mentioned in the email',
                    style: const TextStyle(
                        color: Color(0xFF989898),
                        fontFamily: Constans.fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomOtpField(
                    onSubmit: (String verificationCode) async {
                      authController.verificationCode = verificationCode;
                      authController.otpBorderColor = Colors.black;
                      authController.isLoading = true;
                      authController.update();
                      var response = await authController.verifyForgotPassword(
                          verificationCode, context);
                      authController.isLoading = false;
                      authController.update();
                      if (response.statusCode>=200&&response.statusCode<300) {
                        authController.otpBorderColor = Colors.green;
                        authController.otpEnabledBorderColor = Colors.green;
                        authController.otpReadOnly = true;
                        authController.otpAutoFocuse = false;
                        await Future.delayed(const Duration(seconds: 1));
                        Get.offAll(ResetPassword());
                        authController.otpReadOnly = false;
                        authController.otpBorderColor = Colors.black;
                        authController.otpEnabledBorderColor=Colors.transparent;
                      } else {
                        authController.otpEnabledBorderColor = Colors.red;
                        authController.otpBorderColor = Colors.red;
                        authController.update();
                      }
                    },
                    readOnly: authController.otpReadOnly,
                    autoFocus: authController.otpAutoFocuse,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Resend Code?',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: Constans.fontFamily,
                                  color: Constans.test),
                            ),
                          ],
                        ),
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
