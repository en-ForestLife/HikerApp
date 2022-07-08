import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';
import 'package:hiker/src/model/ForestInformationModel.dart';
import '../api/forestInformationApi.dart';
import '../controller/DictionarySearchController.dart';
import 'package:hiker/src/main/ForestListSquare.dart';
import '../model/ForestInformationModel.dart';

class DetailScreen extends StatefulWidget{
  const DetailScreen({Key? key}) : super(key: key);
  @override
  DetailScreenState createState()=> DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(DictionarySearchController()).obs;
      }),
      home: DetaleWidget(),
    );
  }
}

class DetaleWidget extends GetView<DictionarySearchController> {
  //const ListPage({Key? key}) : super(key: key);

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
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          child: Obx((){
            return Column(
              children: [
                //Image.network(info[0].mntnattchimageseq!),
                //infoWidget("산이름", info[0].mntnnm!),
                //infoWidget("높이", info[0].mntninfohght!),
                //infoWidget("산정보부제", info[0].mntnsbttlinfo!),
                //infoWidget("산정보소재지(소재지)", info[0].mntninfopoflc!),
//
                //Image.network(info[1].mntnattchimageseq!),
                //infoWidget("산이름", info[1].mntnnm!),
                //infoWidget("높이", info[1].mntninfohght!),
                //infoWidget("산정보부제", info[1].mntnsbttlinfo!),
                //infoWidget("산정보소재지(소재지)", info[1].mntninfopoflc!),
//
                //Image.network(info[3].mntnattchimageseq!),
                //infoWidget("산이름", info[3].mntnnm!),
                //infoWidget("높이", info[3].mntninfohght!),
                //infoWidget("산정보부제", info[3].mntnsbttlinfo!),
                //infoWidget("산정보소재지(소재지)", info[3].mntninfopoflc!),
              ],
            );
          }),
        ),
      ),
    );
  }
}