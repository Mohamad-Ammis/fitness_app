import 'package:fitnessapp/views/auth_pages/login_page/widgets/login_info_body.dart';
import 'package:flutter/material.dart';

class LoginInfo extends StatelessWidget {
  const LoginInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height / 2 + 100,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: const Color(0xFF08051A),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32))),
      child: const LoginInfoBody(),
    );
  }
}

