import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controller/translateLanguage.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {

  translateLanguage lan = new translateLanguage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(
          'title'.tr(),
          semanticsLabel: 'rate'.tr(),
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
        centerTitle: true,
        // 글자 중간으로 위치 지정
        elevation: 0.0,
        // 붕 떠 있는 효과를 줌
        backgroundColor: Colors.white, // 배경색상 흰색
      ),
      body:Container(
        child : OutlinedButton.icon(
          onPressed: () {
            lan.getTranslation_papago();
            // 영어로 언어 변경
            // 이후 앱을 재시작하면 영어로 동작
            //EasyLocalization.of(context)!.setLocale(Locale('en'));
          },
          icon: Icon(Icons.language_outlined),
          label: Text(
            'title'.tr(),
          ),
        ),
      ),
      bottomNavigationBar:BottomAppBar(

      ),
    );
  }
}
