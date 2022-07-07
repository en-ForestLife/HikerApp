import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../controller/DictionarySearchController.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../model/ForestInformationModel.dart';

class ForestDetailSquare extends GetView<DictionarySearchController> {
  List<String?> imgList = [];
  ForestInformationModel mountainInformation;
  ForestDetailSquare(this.mountainInformation);

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(15), 
          child: Obx((){
            controller.fetchSearchResult(mountainInformation.mntnnm);
            var info = controller.thumnailList.value;

            imgList.clear();
            for (int i = 0; i<10; i++){
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
                  itemWidth: 300.0,
                  itemCount: imgList.length,
                  itemBuilder: (BuildContext context, int index){
                    return Image.network(imgList[index]!);
                  },
                )
              )
            );
            //return Column(
            //  children: [
            //    Image.network(info[0].thumbnail!),
            //  ],
            //);
          }),
        )
    );
  }
}
