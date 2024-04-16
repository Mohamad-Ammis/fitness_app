
import 'package:fitnessapp/views/auth_pages/register_page/widgets/register_form.dart';
import 'package:fitnessapp/views/auth_pages/register_page/widgets/register_page_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterPageBody extends StatelessWidget {
  const RegisterPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height/5,),
              const RegisterPageHeader(),
              const RegisterPageForm()
              ],
          ),
        ),
      ],
    );
  }
}
