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
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Obx((){
          var info = controller.forestInformation.value;
          return Column(
            children: [
              infoWidget("mntnnm", info.mntnnm!),
              infoWidget("mntnid", info.mntnid!),
              infoWidget("crcmrsghtngetcimageseq", info.crcmrsghtngetcimageseq!),
              infoWidget("crcmrsghtnginfodscrt", info.crcmrsghtnginfodscrt!),
              infoWidget("hkngpntdscrt", info.hkngpntdscrt!),
              infoWidget("hndfmsmtnmapimageseq", info.hndfmsmtnmapimageseq!),
              infoWidget("mntninfohght", info.mntninfohght!),
              infoWidget("mntnsbttlinfo", info.mntnsbttlinfo!),

            ],
          );
        }),
      )
    );
  }

}