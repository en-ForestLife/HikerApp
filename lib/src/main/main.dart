import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiker/src/controller/forestInformationController.dart';
import './mainPage.dart';

void main() {
  runApp(HikerApp());
}

class HikerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(ForestInformationController());
      }),
      home:MainPage(),
    );
  }
}



