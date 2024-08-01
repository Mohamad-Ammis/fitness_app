import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:fitnessapp/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ElegantNotification showSuccesSnackBar(title, message, {context}) {
  return ElegantNotification.success(
    animationCurve: Curves.bounceInOut,
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8), topRight: Radius.circular(8)),
    toastDuration: 2.seconds,
    position: Alignment.topCenter,
    animation: AnimationType.fromTop,
    title: Text(
      title,
      style: const TextStyle(fontFamily: Constans.fontFamily),
    ),
    description:
        Text(message, style: const TextStyle(fontFamily: Constans.fontFamily)),
  );
}

ElegantNotification showErrorSnackBar(title, message) {
  return ElegantNotification.error(
    animationCurve: Curves.bounceInOut,
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8), topRight: Radius.circular(8)),
    toastDuration: 2.seconds,
    position: Alignment.topCenter,
    animation: AnimationType.fromTop,
    title: Text(
      title,
      style: const TextStyle(fontFamily: Constans.fontFamily),
    ),
    description:
        Text(message, style: const TextStyle(fontFamily: Constans.fontFamily)),
  );
}

ElegantNotification showInfoSnackBar(title, message) {
  return ElegantNotification.info(
    animationCurve: Curves.bounceInOut,
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8), topRight: Radius.circular(8)),
    toastDuration: 2.seconds,
    position: Alignment.topCenter,
    animation: AnimationType.fromTop,
    title: Text(
      title,
      style: const TextStyle(fontFamily: Constans.fontFamily),
    ),
    description:
        Text(message, style: const TextStyle(fontFamily: Constans.fontFamily)),
  );
}
