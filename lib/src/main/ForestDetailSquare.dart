import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../controller/DictionarySearchController.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../utils/xmlUtils.dart';
import '../model/ForestInformationModel.dart';
import '../controller/translateLanguage.dart';

class ForestDetailSquare extends GetView<DictionarySearchController> {
  List<String?> imgList = [];
  ForestInformationModel mountainInformation;
  ForestDetailSquare(this.mountainInformation);

  @override
  Widget build(BuildContext context) {
    controller.fetchSearchResult(mountainInformation.mntnnm);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '상세',
            style: TextStyle(
                color: Colors.black, // 글자 색상 검정색
                fontSize: 22.0, // 폰트 사이즈
                fontWeight: FontWeight.bold // 폰트 굵기
            ),
          ),
          leading: IconButton(
            // 리딩 부분 (뒤로가기)
            onPressed: () {
              // 버튼
              Navigator.pop(context); //뒤로가기
            },
            color: Colors.black, // 버튼 색상
            icon: Icon(Icons.arrow_back), // 뒤로가기 이미지 아이콘
          ),
          backgroundColor: Colors.white,
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Obx((){
                var info = controller.thumnailList.value;
                imgList.clear();
                for (int i = 0; i<info.length; i++){
                  if (info[i].thumbnail != ""){
                    imgList.add(info[i].thumbnail);
                  }
                }

                return Container(
                    height: 200,
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Swiper(
                          autoplay: true,
                          scale: 1,
                          control: SwiperControl(),
                          pagination: SwiperPagination(),
                          itemCount: imgList.length,
                          itemBuilder: (BuildContext context, int index){
                            return Image.network(
                                imgList[index]!,
                                fit: BoxFit.fitWidth,
                                //fit:BoxFit.cover
                            );
                          },
                        )
                    )
                );
              }),

              const SizedBox(
                height: 20,
              ), //SizedBox

              Text(mountainInformation.mntnnm!), // 산이름
              Text(mountainInformation.mntninfohght! + 'm'), //산 높이
              const SizedBox(
                height: 40,
              ), //SizedBox

              //Text(TranslateLanguage(XmlUtils.deleteTag(mountainInformation.mntninfodtlinfocont!)).getOtherLanguage()), // 상세정보내용
              Text(XmlUtils.deleteTag(mountainInformation.mntninfodtlinfocont!)), // 상세정보내용
              const SizedBox(
                height: 40,
              ), //SizedBox
              Text(XmlUtils.deleteTag(mountainInformation.pbtrninfodscrt!)), //대중교통정보설명

              const SizedBox(
                height: 40,
              ), //SizedBox
              Text(XmlUtils.deleteTag(mountainInformation.hkngpntdscrt!)), // 산행포인트설명

              const SizedBox(
                height: 40,
              ), //SizedBox
              Text(XmlUtils.deleteTag(mountainInformation.crcmrsghtnginfoetcdscrt!)), // 산정보주변관광정보기타코스설명






            ]
        )
        )
    );
  }
}
