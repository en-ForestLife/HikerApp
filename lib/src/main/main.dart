import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : joinPage()
    );
  }
}


class joinPage extends StatelessWidget { // 회원가입 페이지
  const joinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar : AppBar(
          title : const Text('회원정보 입력 및 동의',
            style: TextStyle
              (
                color:Colors.black, // 글자 색상 검정색
                fontSize: 22.0, // 폰트 사이즈
                fontWeight: FontWeight.bold // 폰트 굵기
            ),
          ),
          leading:  IconButton( // 리딩 부분 (뒤로가기)
          onPressed: () { // 버튼
          Navigator.pop(context); //뒤로가기
          },
            color: Colors.black, // 버튼 색상
            icon: Icon(Icons.arrow_back), // 뒤로가기 이미지 아이콘
          ),

          centerTitle: true, // 글자 중간으로 위치 지정
          elevation: 0.0, // 붕 떠 있는 효과를 줌
          backgroundColor: Colors.white, // 배경색상 흰색
        ),
        body : Container(),
        bottomNavigationBar: BottomAppBar(child : Text('하단바')),
      );
  }
}
 
