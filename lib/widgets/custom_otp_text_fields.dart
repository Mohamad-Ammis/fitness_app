import 'package:fitnessapp/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class CustomOtpField extends StatelessWidget {
  const CustomOtpField({
    super.key, required this.onSubmit, required this.readOnly, required this.autoFocus,
  });
  final void Function(String)? onSubmit;
  final bool readOnly;
  final bool autoFocus;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return OtpTextField(
            cursorColor: Colors.black,
            numberOfFields: 6,
            fieldWidth: 50,
            fieldHeight: 60,
            borderRadius: BorderRadius.circular(8),
            filled: true,
            fillColor: const Color(0xFFF0F1F2),
            borderWidth: 1,
            borderColor: Colors.transparent,
            enabledBorderColor: Colors.transparent,
            focusedBorderColor: controller.otpBorderColor,
            disabledBorderColor: Colors.transparent,
            autoFocus: autoFocus,
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit:onSubmit,
            readOnly: readOnly,
          );
        });
  }
}
