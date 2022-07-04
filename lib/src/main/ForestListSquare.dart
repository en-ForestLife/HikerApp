import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controller/forestInformationController.dart';
import '../model/forestInformation.dart';

class ForestListSquare extends GetView<ForestInformationController> {
  int index;
  ForestListSquare(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 500,
        height: 510,
        child: Obx(() {
          var information = controller.forestInformation.value;
          String imageUrl = information[index].mntnattchimageseq.toString();

          if(!imageUrl.contains("FILE")) {
            imageUrl = 'https://ifh.cc/g/FapjP1.png';
          }

         return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child:
                Image.network(imageUrl,
                    width:450,
                    height:400,
                    fit: BoxFit.fill,
                ),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget> [
                  Text('\n', style:TextStyle(fontSize:5)),
                  Text(information[index].mntnnm ?? '', style:TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 2.0), textAlign: TextAlign.left,),
                  Text(information[index].mntnsbttlinfo ?? '', style: TextStyle(fontSize: 14,)),
                  Text(information[index].mntninfopoflc ?? '', style: TextStyle(fontSize: 14,)),
                  Text(information[index].mntninfohght ?? '', style: TextStyle(fontSize: 14,)),
              ]
              )
            ]
        );
  }),
        ),
    );
  }
}
