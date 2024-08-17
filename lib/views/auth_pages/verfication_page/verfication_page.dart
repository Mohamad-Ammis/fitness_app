// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/auth_controller.dart';
import 'package:fitnessapp/helper/custom_toast_notification.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/views/data_page/data.dart';
import 'package:fitnessapp/widgets/custom_otp_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final authController = Get.put(AuthController());
  Timer? _timer;
  int _start = 30;

  void startTimer() {
    _start = 30;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
        debugPrint(_start.toString());
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String email = authController.email.substring(0, 2);
    final secret = '*' *
        authController.email
            .substring(2, authController.email.length - 10)
            .length;
    email += secret +
        authController.email.substring(authController.email.length - 10);
    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: !authController.isLoading
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Lottie.asset('assets/lottie/otp.json', width: 260),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      const Text(
                        'Enter Verification Code',
                        style: TextStyle(
                            fontSize: 38, fontFamily: Constans.fontFamily),
                      ),
                      Text(
                        'Enter code that we have sent to your email $email',
                        style: const TextStyle(
                            fontSize: 15, fontFamily: Constans.fontFamily),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomOtpField(
                        onSubmit: (String verificationCode) async {
                          authController.otpBorderColor = Colors.black;
                          authController.isLoading = true;
                          authController.update();
                          var response = await authController
                              .registerVerification(verificationCode, context);
                          authController.isLoading = false;
                          authController.update();
                          if (response.statusCode >= 200 &&
                              response.statusCode < 300) {
                            authController.otpEnabledBorderColor = Colors.green;
                            authController.otpBorderColor = Colors.green;
                            authController.otpReadOnly = true;
                            authController.otpAutoFocuse = false;
                            var data = jsonDecode(response.body);
                            userInfo!
                                .setString('id', data['user']['id'].toString());
                            userInfo!.setString('token', data['token']);
                            await Future.delayed(const Duration(seconds: 1));
                            Get.to(Data());
                            authController.otpReadOnly = false;
                            authController.otpBorderColor = Colors.black;
                            authController.otpEnabledBorderColor =
                                Colors.transparent;
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
                            GestureDetector(
                              onTap: _start == 0
                                  ? () async {
                                      bool status =
                                          await authController.resendCode();
                                      if (status) {
                                        startTimer();
                                        showSuccesSnackBar(
                                                'Success', "check your email")
                                            .show(context);
                                      } else {
                                        showErrorSnackBar('Error',
                                                'some thing went wrong')
                                            .show(context);
                                      }
                                    }
                                  : null,
                              child: Text(
                                'ٌResend Code ? ',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: Constans.fontFamily,
                                    color: Constans.test),
                              ),
                            ),
                            _start != 0
                                ? Text(
                                    '  $_start',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: Constans.fontFamily,
                                        color: Constans.test),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      );
    });
  }
}
