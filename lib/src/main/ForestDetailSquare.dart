import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../controller/DictionarySearchController.dart';

class ForestDetailSquare extends GetView<DictionarySearchController> {

  var information;
  ForestDetailSquare(this.information);

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
            var info = controller.thumnailList.value;
            var len = info.length;
            print(info[0].thumbnail);
            return Column(
              children: [
                Image.network(info[0].thumbnail!),
              ],
            );
          }),
        )
    );
  }
}
