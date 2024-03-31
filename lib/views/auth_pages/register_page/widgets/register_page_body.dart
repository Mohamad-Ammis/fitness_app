
import 'package:fitnessapp/views/auth_pages/register_page/widgets/register_form.dart';
import 'package:fitnessapp/views/auth_pages/register_page/widgets/register_page_header.dart';
import 'package:flutter/material.dart';

class RegisterPageBody extends StatelessWidget {
  const RegisterPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const RegisterPageHeader(),
        RegisterPageForm()
        ],
    );
  }
}
