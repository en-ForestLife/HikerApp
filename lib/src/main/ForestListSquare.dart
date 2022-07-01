import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controller/forestInformationController.dart';

class ForestListSquare extends GetView<ForestInformationController> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 500,
        height: 510,
        child: Obx(() {
          var information = controller.forestInformation.value;
         return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                    "https://a.cdn-hotels.com/gdcs/production1/d1156/f6d7ba6d-b1b2-4cc6-bc62-9cef6e70db29.jpg?impolicy=fcrop&w=800&h=533&q=medium",
                    width:450,
                    height:400,
                    fit: BoxFit.fill
                ),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget> [
                  Text('\n', style:TextStyle(fontSize:5)),
                  Text(information.mntnnm ?? '', style:TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 2.0), textAlign: TextAlign.left,),
                  Text(information.mntnsbttlinfo ?? '', style: TextStyle(fontSize: 14,)),
                  Text(information.mntninfopoflc ?? '', style: TextStyle(fontSize: 14,)),
                  Text(information.mntninfohght ?? '', style: TextStyle(fontSize: 14,)),
              ]
              )
            ]
        );
  }),
        ),
    );
  }
}
