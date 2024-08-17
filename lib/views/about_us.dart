import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/controller/aboutus_controller.dart';
import 'package:fitnessapp/models/developer_model.dart';
import 'package:fitnessapp/utils/app_images.dart';
import 'package:fitnessapp/views/auth_pages/widgets/auth_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  AboutUs({super.key});
  final controller = Get.put(AboutusController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F4F6),
        scrolledUnderElevation: 0,
        title: Text(
          "TRAINIG HACKS TEAM",
          style:
              TextStyle(color: Colors.black, fontFamily: Constans.fontFamily),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF3F4F6),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // childAspectRatio: 0.7,
                      childAspectRatio: 0.65,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemCount: controller.developers.length,
                  itemBuilder: (context, index) {
                    return IntrinsicHeight(
                        child:
                            DeveloperCard(model: controller.developers[index]));
                  }),
            ),
          )
        ],
      ),
    );
  }
}

class DeveloperCard extends StatelessWidget {
  const DeveloperCard({
    super.key,
    required this.model,
  });
  final DeveloperModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(model.image),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(.1), BlendMode.colorBurn)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(blurRadius: 8, color: Colors.black.withOpacity(.1))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Container(
          //   width: 120,
          //   clipBehavior: Clip.hardEdge,
          //   height: 120,
          //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(999)),
          //   // child: Image.asset(
          //   //   'assets/images/1.jpg',
          //   //   fit: BoxFit.cover,
          //   // ),
          // ),
          SizedBox(
            height: 5,
          ),
          Container(
            color: Colors.black.withOpacity(.2),
            width: MediaQuery.sizeOf(context).width,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  model.name,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontFamily: Constans.fontFamily,
                  ),
                ),
                SizedBox(
                    width: 140,
                    child: Divider(
                      thickness: 0.4,
                    )),
                Text(
                  model.position,
                  style: TextStyle(
                    height: 1,
                    color: Colors.white,
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                    fontFamily: Constans.fontFamily,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                AuthCustomButton(
                  padding: 12,
                  width: MediaQuery.sizeOf(context).width / 2.8,
                  borderRadius: 10,
                  backgroundColor: Color(0xFF375FFF),
                  buttonText: Text(
                    "Contact me",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onTap: () async {
                    var uri = Uri.parse(model.url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication);
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
