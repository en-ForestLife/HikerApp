import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
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
    bool languageButton = false;
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
          actions: [
            OutlinedButton.icon(
              // 언어 바꿀 수 있는 버튼
              onPressed: () {
                // 영어로 언어 변경
                // 이후 앱을 재시작하면 영어로 동작
                if (!languageButton) {
                  // 영어
                  //EasyLocalization.of(context)!.setLocale(Locale('en'));
                  languageButton = true;
                } else {
                  // 한국어
                  EasyLocalization.of(context)!.setLocale(Locale('ko'));
                  languageButton = false;
                }
              },
              icon: Icon(Icons.language_outlined),
              label: Text(
                "Language",
              ),
            ),
          ],
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

                  Text(mountainInformation.mntnnm!, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)), // 산이름
                  Text(mountainInformation.mntninfohght! + 'm', style: TextStyle(fontWeight: FontWeight.bold),), //산 높이
                  const SizedBox(
                    height: 40,
                  ), //SizedBox

                  //Text(TranslateLanguage(XmlUtils.deleteTag(mountainInformation.mntninfodtlinfocont!)).getOtherLanguage()), // 상세정보내용
                  Text('<상세정보>', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(XmlUtils.deleteTag(mountainInformation.mntninfodtlinfocont!)), // 상세정보내용
                  const SizedBox(
                    height: 40,
                  ), //SizedBox

                  Text('<대중교통정보>', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(getInformation(XmlUtils.deleteTag(mountainInformation.pbtrninfodscrt!))), //대중교통정보설명

                  const SizedBox(
                    height: 40,
                  ), //SizedBox

                  Text('<산행포인트>', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(getInformation(XmlUtils.deleteTag(mountainInformation.hkngpntdscrt!))), // 산행포인트설명

                  const SizedBox(
                    height: 40,
                  ), //SizedBox

                  Text('<주변관광정보>', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(getInformation(XmlUtils.deleteTag(mountainInformation.crcmrsghtnginfoetcdscrt!))), // 산정보주변관광정보기타코스설명
                ]
            )
        )
    );
  }

  String getInformation(String information) {
    if (information.trim().length == 0) {
      return '정보 준비중입니다!';
    }
    return information;
  }
}