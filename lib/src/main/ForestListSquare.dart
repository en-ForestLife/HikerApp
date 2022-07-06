import 'dart:html';
import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import '../controller/forestInformationController.dart';

class ForestListSquare extends GetView<ForestInformationController> {
  int index;
  ForestListSquare(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 450,
        height: 510,
        child: Obx(() {
          var information = controller.forestInformation.value.obs;
          String imageUrl = getUrl(information);

          return  Container(
            child : Column(
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(imageUrl,
                            width: double.infinity,
                            height: 400,
                            fit: BoxFit.fill,
                            // 밑에꺼가 이미지 로딩 표시 만드는건데 검색할 때 뜰 때가 있고 안 뜰 때가 있음.. 이유는 모름
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress){
                              if(loadingProgress == null){
                                return child;
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                ),
                              );
                            },
                          ),
                        ),
                        Text('\n', style: TextStyle(fontSize: 5)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Text(information[index].mntnnm ?? '', style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0),),],
                        ),
                        Text(addSubtitle(information),
                            style: TextStyle(fontSize: 14,)),
                        Text(information[index].mntninfopoflc ?? '',
                            style: TextStyle(fontSize: 14,)),
                        Text(getHeightFormat(information),
                            style: TextStyle(fontSize: 14,)),
                      ]
                  )
                ]
            ),
          );
        }),
      ),
    );
  }

  String getUrl(var information) { // api ui 이미지 불러와지는지 판단한 후 이미지 내보내는 함수
    String imageUrl = information[index].mntnattchimageseq.toString();
    if(imageUrl.contains("FILE_000000000423986")) { // 특수 예외
      return 'https://ifh.cc/g/FapjP1.png';
    }
    if (imageUrl.contains("FILE")) {
      return imageUrl;
    }
    return 'https://ifh.cc/g/FapjP1.png';
  }

  String getHeightFormat(var information) { // 산 높이 값 콤마 표시 및 단위 추가 함수
    var format = NumberFormat('###,###,###,###');

    return format.format(int.parse(information[index].mntninfohght.toString())) + 'm';
  }

  String addSubtitle(var information) { // 부제 없는 산은 부제 따로 추가
    String subTitle = information[index].mntnsbttlinfo.toString();
    if(subTitle.length == 1) { // 주의 - 부제가 안나오지만 길이는 1로 계산됨
      return '공기 맑은 산'; //
    }
    return subTitle;
  }
}


