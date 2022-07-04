import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myPage extends StatefulWidget {
  const myPage({Key? key}) : super(key: key);

  @override
  State<myPage> createState() => _myPageState();
}

class _myPageState extends State<myPage> {
  bool languageButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '마이 페이지',
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
          OutlinedButton.icon(
            // 언어 바꿀 수 있는 버튼
            onPressed: () {
              // 영어로 언어 변경
              // 이후 앱을 재시작하면 영어로 동작
              if (!languageButton) {
                // 영어
                EasyLocalization.of(context)!.setLocale(Locale('en'));
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
        centerTitle: true,
        // 글자 중간으로 위치 지정
        elevation: 0.0,
        // 붕 떠 있는 효과를 줌
        backgroundColor: Colors.white, // 배경색상 흰색
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [

              Container(
              height: 100,
              width: double.infinity,
              color: Colors.yellowAccent,
                padding: EdgeInsets.fromLTRB(20, 30, 20, 40),
                child : Row(
                  children: [
                    Container(
                    child: Text('조준희'),

                    ),
                ],
                ),
              ),

              Container(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Colors.grey[850],
                      ),
                      title: Text('홈'),
                      onTap: () {
                        print('Home pressed');
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Colors.grey[850],
                      ),
                      title: Text('홈'),
                      onTap: () {
                        print('Home pressed');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
