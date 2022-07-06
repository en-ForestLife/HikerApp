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
          print(information);
          print('산산');
          String imageUrl = getUrl(information);

          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child:
                        Image.network(imageUrl,
                          width: 450,
                          height: 400,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text('\n', style: TextStyle(fontSize: 5)),
                      Text(information[index].mntnnm ?? '', style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0), textAlign: TextAlign.left,),
                      Text(addSubtitle(information),
                          style: TextStyle(fontSize: 14,)),
                      Text(information[index].mntninfopoflc ?? '',
                          style: TextStyle(fontSize: 14,)),
                      Text(getHeightFormat(information),
                          style: TextStyle(fontSize: 14,)),
                    ]
                )
              ]
          );
        }),
      ),
    );
  }

  String getUrl(var information) { // api ui 이미지 불러와지는지 판단한 후 이미지 내보내는 함수
    String imageUrl = information[index].mntnattchimageseq.toString();
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
