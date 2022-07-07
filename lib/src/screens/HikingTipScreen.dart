import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HikingTipScreen extends StatefulWidget {
  HikingTipScreen({Key? key}) : super(key: key);

  @override
  State<HikingTipScreen> createState() => _HikingTipScreen();
}

class _HikingTipScreen extends State<HikingTipScreen>{
  bool isEnglish = false;
  String imageUrl = 'https://ifh.cc/g/m8KaDr.jpg';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TIP',
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
        actions: [
          OutlinedButton.icon( // 언어 바꿀 수 있는 버튼
            onPressed: () {
              if(!isEnglish){ // 영어
                isEnglish = true;
                setState(() {
                  imageUrl = 'https://ifh.cc/g/gPakDN.jpg';
                });
              }
              else{ // 한국어
                isEnglish = false;
                setState(() {
                  imageUrl = 'https://ifh.cc/g/m8KaDr.jpg';
                });
              }
            },
            icon: Icon(Icons.language_outlined),
            label: Text(
              "Language",
            ),
          ),
        ],
        centerTitle: true,
        // 글자 중간으로 위치 지정
        elevation: 0.0,
        // 붕 떠 있는 효과를 줌
        backgroundColor: Colors.white, // 배경색상 흰색
      ),
      body: SingleChildScrollView(
        child: Image.network(imageUrl,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      )

    );
  }
}