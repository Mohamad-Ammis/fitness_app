// ignore_for_file: avoid_print
// ignore: must_be_immutable
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/edit_userinfo_controller.dart';
import 'package:fitnessapp/helper/validation.dart';
import 'package:fitnessapp/views/workout_page/profile/widgets/alertdialog.dart';
import 'package:fitnessapp/views/workout_page/profile/widgets/checkbox.dart';
import 'package:fitnessapp/views/workout_page/profile/widgets/container.dart';
import 'package:fitnessapp/views/workout_page/profile/widgets/custom_pass_text_field.dart';
import 'package:fitnessapp/views/workout_page/profile/widgets/customshapeborder.dart';
import 'package:fitnessapp/views/workout_page/profile/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Controller controller = Get.put(Controller(), permanent: true);

  Color kPrimer = const Color.fromARGB(255, 38, 164, 170);

  Color bPrimer = const Color(0xfff3f4f6);

  bool? isLoading = false;
  bool? isLoadingPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bPrimer,
      body: SingleChildScrollView(
        child: GetBuilder<Controller>(builder: (controller) {
          return Form(
              key: controller.formKeyAll,
              child: isLoading == true
                  ? const Padding(
                      padding: EdgeInsets.only(top: 370, left: 180),
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    )
                  : Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Positioned(
                              child: Container(
                                decoration: ShapeDecoration(
                                  color: kPrimer,
                                  shape: CustomShapeBorder(),
                                ),
                                height: 180,
                                width: double.infinity,
                                clipBehavior: Clip.none,
                              ),
                            ),
                            Positioned(
                              bottom: 220,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 60),
                                      child: IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: const Icon(
                                          Icons.arrow_back_ios_new,
                                          size: 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 120),
                                      child: Text(
                                        " Edit Profile",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontFamily: Constans.fontFamily,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              child: GetBuilder<Controller>(
                                builder: (controller) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 170, bottom: 0, left: 0),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        CircleAvatar(
                                          radius: 75,
                                          backgroundImage: controller.image ==
                                                  null
                                              ? const AssetImage(
                                                      "assets/images/pro.jpeg")
                                                  as ImageProvider
                                              : FileImage(controller.image!),
                                        ),
                                        Positioned(
                                          top: 120,
                                          left: 105,
                                          child: CircleAvatar(
                                              radius: 15,
                                              backgroundColor: Colors.white,
                                              child: IconButton(
                                                onPressed: () {
                                                  controller.getImage();
                                                  print(controller.image);
                                                },
                                                icon: const Icon(
                                                  Icons.camera_alt_outlined,
                                                  size: 18,
                                                  color: Colors.black,
                                                ),
                                                padding:
                                                    const EdgeInsets.all(2),
                                              )),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 0),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 3, right: 3, bottom: 15),
                          child: CustomTextFieldUnderline(
                            labelText: "Bio",
                            onSaved: (value) {
                              controller.bio = value!;
                              // print(value);
                            },
                            validation: (value) {
                              return FormValidators().bioValidator(value);
                            },
                            icon: (Icons.edit),
                            iconColor: kPrimer,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 3, right: 3, bottom: 15),
                          child: CustomTextFieldUnderline(
                            labelText: "Name",
                            onSaved: (value) {
                              controller.name = value!;
                              // print(value);
                            },
                            validation: (value) {
                              return FormValidators().userNameValidator(value);
                            },
                            icon: (Icons.person),
                            iconColor: kPrimer,
                          ),
                        ),
                        const SizedBox(height: 6),
                        CustomContainer(
                            text: 'Change Password',
                            icon: Icons.lock,
                            widget:
                                GetBuilder<Controller>(builder: (controller) {
                              return CustomAlertDialog(
                                  action: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: const Text(
                                              "Close",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily:
                                                      Constans.fontFamily),
                                            )),
                                        TextButton(
                                            onPressed: () async {
                                              if (controller
                                                  .formKeypass.currentState!
                                                  .validate()) {
                                                controller.isLoadingTure();
                                                controller
                                                    .formKeypass.currentState!
                                                    .save();
                                                try {
                                                  await controller.postPassword(
                                                      controller
                                                          .currentpassword,
                                                      controller.newpassword,
                                                      controller
                                                          .confimnewpassword);
                                                  Get.snackbar('Success',
                                                      'Password changed successfully');
                                                } catch (e) {
                                                  Get.snackbar(
                                                    'Error',
                                                    'No Internet ,Please try again later.',
                                                  );
                                                }

                                                controller.isLoadingFalse();

                                                // controller.currentPass.clear();
                                                // controller.confimPass.clear();
                                                // controller.newPass.clear();
                                              }
                                            },
                                            child: const Text(
                                              "Save",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily:
                                                      Constans.fontFamily),
                                            ))
                                      ],
                                    )
                                  ],
                                  titleText: "Password",
                                  content: controller.isLoadingpass == true
                                      ? const Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                              CircularProgressIndicator(
                                                color: Colors.black,
                                              ),
                                            ])
                                      : Form(
                                          key: controller.formKeypass,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: SizedBox(
                                              width: 400,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  CustomPasswordTextField(
                                                    textStyle: const TextStyle(
                                                        color: Colors.black),
                                                    cursorColor:
                                                        const Color(0xFFC0D8F2),
                                                    label: "Current password",
                                                    labelStyle: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 16,
                                                        fontFamily: Constans
                                                            .fontFamily),
                                                    filled: true,
                                                    fillColor: Colors.grey
                                                        .withOpacity(0.1),
                                                    focusedBorderColor:
                                                        const Color(0xFFC0D8F2),
                                                    enabledBorderColor:
                                                        Colors.transparent,
                                                    onSaved: (value) {
                                                      controller
                                                              .currentpassword =
                                                          value!;
                                                    },
                                                    validatpass: (value) {
                                                      if (value != null) {
                                                        if (value.isEmpty) {
                                                          return "Required Field";
                                                        } else if (controller
                                                                .oldPassword !=
                                                            value) {
                                                          return " Your old password \n was entered incorrectly";
                                                        } else {
                                                          return null;
                                                        }
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                    controllerText:
                                                        controller.currentPass,
                                                  ),
                                                  CustomPasswordTextField(
                                                    textStyle: const TextStyle(
                                                        color: Colors.black),
                                                    cursorColor:
                                                        const Color(0xFFC0D8F2),
                                                    label: "New password",
                                                    labelStyle: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 16,
                                                        fontFamily: Constans
                                                            .fontFamily),
                                                    filled: true,
                                                    fillColor: Colors.grey
                                                        .withOpacity(0.1),
                                                    focusedBorderColor:
                                                        const Color(0xFFC0D8F2),
                                                    enabledBorderColor:
                                                        Colors.transparent,
                                                    onSaved: (value) {
                                                      controller.newpassword =
                                                          value!;
                                                    },
                                                    validatpass: (value) {
                                                      return FormValidators()
                                                          .strongPasswordValidator(
                                                              value);
                                                    },
                                                    controllerText:
                                                        controller.newPass,
                                                  ),
                                                  CustomPasswordTextField(
                                                    textStyle: const TextStyle(
                                                        color: Colors.black),
                                                    cursorColor:
                                                        const Color(0xFFC0D8F2),
                                                    label:
                                                        "Confim new password",
                                                    labelStyle: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 16,
                                                        fontFamily: Constans
                                                            .fontFamily),
                                                    filled: true,
                                                    fillColor: Colors.grey
                                                        .withOpacity(0.1),
                                                    focusedBorderColor:
                                                        const Color(0xFFC0D8F2),
                                                    enabledBorderColor:
                                                        Colors.transparent,
                                                    controllerText:
                                                        controller.confimPass,
                                                    onSaved: (value) {
                                                      controller
                                                              .confimnewpassword =
                                                          value!;
                                                    },
                                                    validatpass: (value) {
                                                      if (value != null) {
                                                        if (value.isEmpty) {
                                                          return "Required Field";
                                                        } else if (controller
                                                                .newPass.text !=
                                                            value) {
                                                          return " New password and confim password \n must be same";
                                                        } else {
                                                          return null;
                                                        }
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                  ),
                                                ],
                                              )),
                                        ));
                            })),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: CustomTextFieldOutline(
                                labelText: "Height",
                                onSaved: (value) {
                                  controller.height = value;
                                  // print(value);
                                },
                                validation: (value) {
                                  return FormValidators()
                                      .heightValidator(value);
                                },
                              ),
                            ),
                            Expanded(
                              child: CustomTextFieldOutline(
                                labelText: "Weight",
                                onSaved: (value) {
                                  controller.weight = value;
                                  // print(value);
                                },
                                validation: (value) {
                                  return FormValidators()
                                      .weightValidator(value);
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 6),
                        CustomContainer(
                          icon: Icons.calendar_month_outlined,
                          text: "Weekly goal ",
                          widget: CustomAlertDialog(
                              action: [
                                TextButton(
                                    onPressed: () {
                                      Get.back();
                                      print(controller.days);
                                    },
                                    child: const Text(
                                      "Close",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: Constans.fontFamily),
                                    ))
                              ],
                              titleText: "Weekly goal",
                              content:
                                  GetBuilder<Controller>(builder: (controller) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomCheckBox(
                                        title: "Sunday",
                                        value: controller.sunday,
                                        onChanged: (val) {
                                          controller.updateDay1(val!);
                                        }),
                                    CustomCheckBox(
                                        title: "Monday",
                                        value: controller.monday,
                                        onChanged: (val) {
                                          controller.updateDay2(val!);
                                        }),
                                    CustomCheckBox(
                                        title: "Tuesday",
                                        value: controller.tuesday,
                                        onChanged: (val) {
                                          controller.updateDay3(val!);
                                        }),
                                    CustomCheckBox(
                                        title: "Wednesday",
                                        value: controller.wednesday,
                                        onChanged: (val) {
                                          controller.updateDay4(val!);
                                        }),
                                    CustomCheckBox(
                                        title: "Thursday",
                                        value: controller.thursday,
                                        onChanged: (val) {
                                          controller.updateDay5(val!);
                                        }),
                                    CustomCheckBox(
                                        title: "Friday",
                                        value: controller.friday,
                                        onChanged: (val) {
                                          controller.updateDay6(val!);
                                        }),
                                    CustomCheckBox(
                                        title: "Saturday",
                                        value: controller.saturday,
                                        onChanged: (val) {
                                          controller.updateday7(val!);
                                        }),
                                  ],
                                );
                              })),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: SizedBox(
                            width: 300,
                            height: 43,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (controller.formKeyAll.currentState!
                                    .validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  controller.formKeyAll.currentState!.save();
                                  for (int i = 0;
                                      i < controller.days.length;
                                      i++) {
                                    controller.data["training_days[${i + 1}]"] =
                                        controller.days[i].toString();
                                  }
                                  controller.setData();
                                  try {
                                    await controller.postUserInfo();
                                    Get.snackbar(
                                        'Success', 'Data updated successfully');
                                  } catch (e) {
                                    Get.snackbar(
                                      'Error',
                                      'No Internat ,Please try again later.',
                                    );
                                  }
                                  setState(() {
                                    isLoading = false;
                                  });
                                }

                                // print(controller.currentpassword);
                                // print(controller.newpassword);
                                // print(controller.confimnewpassword);
                                // print(controller.name);
                                // print(controller.bio);
                                // print(controller.height);
                                // print(controller.weight);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                "Save",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: Constans.fontFamily,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ));
        }),
      ),
    );
  }
}
