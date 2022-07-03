import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/forestInformationController.dart';

class ForestInformationScreen extends GetView<ForestInformationController>{
  const ForestInformationScreen({Key? key}) : super(key: key);

  Widget infoWidget(String title, String value){
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 15),
        ),
        Text(
          ":  $value",
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('산 정보'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Obx((){
          var info = controller.forestInformation.value;
          return Column(
            children: [
              Image.network(info[0].mntnattchimageseq!),
              infoWidget("산이름", info[0].mntnnm!),
              infoWidget("높이", info[0].mntninfohght!),
              infoWidget("산정보부제", info[0].mntnsbttlinfo!),
              infoWidget("산정보소재지(소재지)", info[0].mntninfopoflc!),

              Image.network(info[1].mntnattchimageseq!),
              infoWidget("산이름", info[1].mntnnm!),
              infoWidget("높이", info[1].mntninfohght!),
              infoWidget("산정보부제", info[1].mntnsbttlinfo!),
              infoWidget("산정보소재지(소재지)", info[1].mntninfopoflc!),

              Image.network(info[3].mntnattchimageseq!),
              infoWidget("산이름", info[3].mntnnm!),
              infoWidget("높이", info[3].mntninfohght!),
              infoWidget("산정보부제", info[3].mntnsbttlinfo!),
              infoWidget("산정보소재지(소재지)", info[3].mntninfopoflc!),
            ],
          );
        }),
      )
    );
  }

}