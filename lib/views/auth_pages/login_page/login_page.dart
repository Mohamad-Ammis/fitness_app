
import 'package:fitnessapp/views/auth_pages/login_page/widgets/login_image_section.dart';
import 'package:fitnessapp/views/auth_pages/login_page/widgets/login_info.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF08051A),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                LoginImageSection(),
                LoginInfo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
