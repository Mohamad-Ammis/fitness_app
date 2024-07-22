import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/views/workout_page/profile/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  Profile({super.key});
  Color bPrimer = const Color(0xfff3f4f6);
  Color kPrimer = const Color.fromARGB(255, 38, 164, 170);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 100),
                  color: kPrimer.withOpacity(.8),
                  height: 215,
                  alignment: Alignment.center,
                ),
              ),
              ClipPath(
                clipper: WaveClipper(waveDeep: 0, waveDeep2: 100),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  color: kPrimer.withOpacity(.3),
                  height: 180,
                  alignment: Alignment.center,
                ),
              ),
              const Positioned(
                top: 35,
                left: 145,
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: Constans.fontFamily,
                    color: Colors.white,
                  ),
                ),
              ),
              const Positioned(
                top: 145,
                left: 128,
                child: CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage("assets/images/mee.jpg")),
                ),
              ),
              const Positioned(
                top: 305,
                left: 120,
                child: Text(
                  "Sedra Nadr",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: Constans.fontFamily,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 115,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                      radius: 30,
                      backgroundColor: kPrimer,
                      child: const Icon(FontAwesomeIcons.fire,
                          size: 35, color: Colors.white70)),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "90",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: Constans.fontFamily),
                  ),
                  const Text(
                    "Calories",
                    style: TextStyle(
                        color: Color(0xFF1F1E28),
                        fontSize: 18,
                        fontFamily: Constans.fontFamily),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                        radius: 30,
                        backgroundColor: kPrimer,
                        child: const Icon(Icons.sports_gymnastics,
                            size: 35, color: Colors.white70)),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "10",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: Constans.fontFamily),
                    ),
                    const Text(
                      "Exercises",
                      style: TextStyle(
                          color: Color(0xFF1F1E28),
                          fontSize: 18,
                          fontFamily: Constans.fontFamily),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                      radius: 30,
                      backgroundColor: kPrimer,
                      child: const Icon(Icons.timelapse_sharp,
                          size: 35, color: Colors.white70)),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "5",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: Constans.fontFamily),
                  ),
                  const Text(
                    "Minutes",
                    style: TextStyle(
                        color: Color(0xFF1F1E28),
                        fontSize: 18,
                        fontFamily: Constans.fontFamily),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              padding: const EdgeInsets.only(left: 20, right: 20),
              width: 380,
              child: Column(
                children: [
                  CustomListTile(
                    text: "Setting",
                    icon: Icons.settings,
                  ),
                  const Divider(
                    height: 0.2,
                    thickness: 0.1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black54,
                  ),
                  CustomListTile(
                    text: "Notifications",
                    icon: Icons.notifications_active_sharp,
                  ),
                  const Divider(
                    height: 0.2,
                    thickness: 0.1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black54,
                  ),
                  CustomListTile(
                    text: "Edit profile",
                    icon: Icons.mode_edit_outline_outlined,
                    onTap: () {
                      Get.to(() => const EditProfile());
                    },
                  ),
                  const Divider(
                    height: 0.2,
                    thickness: 0.1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black54,
                  ),
                  CustomListTile(
                    text: "Logout",
                    icon: Icons.logout_sharp,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  //   child: Divider(
                  //     height: 7,
                  //     thickness: 1,
                  //     indent: 0,
                  //     endIndent: 0,
                  //     color: Colors.black,
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(65, 25, 50, 0),
                  //   child: CustomContainer(
                  //     text: "Logout",
                  //     tColor: Colors.grey.withOpacity(1),
                  //     icon: Icons.logout_sharp,
                  //     iColor: Colors.grey.withOpacity(0.6),
                  //   ),
                  // ),
                ],
              )),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  CustomContainer(
      {super.key,
      required this.text,
      required this.icon,
      this.tColor,
      this.iColor,
      this.onTap});
  String? text;
  Color? tColor;
  Color? iColor;

  IconData? icon;
  void Function()? onTap;
  Color kPrimer = const Color.fromARGB(255, 38, 164, 170);
  Color bPrimer = const Color(0xfff3f4f6);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: WidgetStatePropertyAll(
        kPrimer.withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 5),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          height: 45,
          width: double.infinity,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  icon,
                  color: iColor,
                ),
              ),
              Text(
                text!,
                style: TextStyle(
                    color: tColor,
                    fontSize: 18,
                    fontFamily: Constans.fontFamily),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  CustomListTile(
      {super.key, required this.text, required this.icon, this.onTap});
  String? text;
  IconData? icon;
  void Function()? onTap;
  Color kPrimer = const Color.fromARGB(255, 38, 164, 170);
  Color bPrimer = const Color(0xfff3f4f6);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.black.withOpacity(0.7),
        ),
        title: Text(
          text!,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontFamily: Constans.fontFamily),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.black,
          size: 18,
        ),
        tileColor: Colors.white,
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double waveDeep;
  final double waveDeep2;

  WaveClipper({this.waveDeep = 100, this.waveDeep2 = 0});
  @override
  Path getClip(Size size) {
    final double sw = size.width;
    final double sh = size.height;

    final Offset controlPoint1 = Offset(sw * .25, sh - waveDeep2 * 2);
    final Offset destinationPoint1 = Offset(sw * .5, sh - waveDeep - waveDeep2);

    final Offset controlPoint2 = Offset(sw * .75, sh - waveDeep * 2);
    final Offset destinationPoint2 = Offset(sw, sh - waveDeep);

    final Path path = Path()
      ..lineTo(0, size.height - waveDeep2)
      ..quadraticBezierTo(controlPoint1.dx, controlPoint1.dy,
          destinationPoint1.dx, destinationPoint1.dy)
      ..quadraticBezierTo(controlPoint2.dx, controlPoint2.dy,
          destinationPoint2.dx, destinationPoint2.dy)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}
