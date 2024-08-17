import 'package:fitnessapp/models/developer_model.dart';
import 'package:get/get.dart';

class AboutusController extends GetxController {
  List<DeveloperModel> developers = [
    DeveloperModel(
        name: 'Leen Awad',
        position: 'Laravel Developer',
        image: 'assets/images/5.jpg',
        url: 'https://www.instagram.com/leen_awad_1?igsh=ZWE1azRubXdydjE0'),
    DeveloperModel(
        name: 'Mohamad Ammis',
        position: 'Flutter Developer',
        image: 'assets/images/1.jpg',
        url: 'https://www.linkedin.com/in/mohamad-ammis/'),
    DeveloperModel(
        name: 'Areej Mahfouz',
        position: 'Flutter Developer',
        image: 'assets/images/2.jpg',
        url: 'https://www.facebook.com/areej.mahfouz.96?mibextid=ZbWKwL'),
    DeveloperModel(
        name: 'Sedra Nadr',
        position: 'Flutter Developer',
        image: 'assets/images/3.jpg',
        url: 'https://www.instagram.com/sedra_nadr?igsh=aHk0bnQ2dW9idXh3'),
    DeveloperModel(
        name: 'Karam Almadani',
        position: 'Laravel Developer',
        image: 'assets/images/4.jpg',
        url: 'https://www.linkedin.com/in/karam-almadani-200837306/'),
    DeveloperModel(
        name: 'Abdullah Abd',
        position: 'ReactJS Developer',
        image: 'assets/images/6.jpg',
        url: 'https://github.com/IT-S-ACE'),
  ];
}
