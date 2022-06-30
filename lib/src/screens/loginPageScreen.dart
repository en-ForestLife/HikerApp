import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/inputDecoration.dart';
import 'joinPageScreen.dart';
import 'memberSearch.dart';

class loginPage extends StatefulWidget {
  loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String password = '';
  String email = '';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '로그인',
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                // 아이디 비밀번호 레이아웃 박스
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white), // 테두리
                  borderRadius: BorderRadius.circular(5), //모서리 둥글게
                ),
                child: Form(
                  key: formKey,
                  child: Theme(
                    // 왜 스타일 적용 안되냐
                    data: ThemeData(
                        primaryColor: Colors.teal,
                        inputDecorationTheme: InputDecorationTheme(
                            labelStyle: TextStyle(
                          fontSize: 15,
                        ))),

                    child: Column(
                      children: [
                        Padding(
                          // 로그인 버튼이랑 텍스트 필드 사이 공간
                          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        ),

                        Email(), // 이메일 입력
                        passwordInput(), // 비밀번호

                        Padding(
                          // 로그인 버튼이랑 텍스트 필드 사이 공간
                          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        ),

                        Container(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
                                  builder: (BuildContext context) {
                                    // return object of type Dialog
                                    return AlertDialog(
                                      title: Text("안내메시지"),
                                      content: Text('로그인 되었습니다.'),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("닫기"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                                return joinPage();
                                              }),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text("로그인"),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black, // 버튼색상
                                onPrimary: Colors.white, // 글자색상
                              ),
                            ),
                        ),
                        Row(
                          children: [
                            searchMember(),
                            joinMember(),
                          ],
                        ),
                      ],
                    ),
                  ), //아이디 비밀번호 레이아웃
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }

  Widget passwordInput() {
    // 비밀번호 위젯
    return SizedBox(
      height: 80,
      child: TextFormField(
        key: ValueKey(2),
        keyboardType: TextInputType.text,
        decoration: decoration()
            .textFormDecoration('영문 대.소문자 + 숫자 + 특수문자 조합 8~15자', '비밀번호'),
        onChanged: (dynamic val) {
          password = val;
          print(password);
        },
        onSaved: (value) {
          password = value!;
        },
        obscureText: true,
      ),
    );
  }

  Widget Email() {
    // 이메일 위젯
    return SizedBox(
      height: 80,
      child: TextFormField(
        key: ValueKey(4),
        keyboardType: TextInputType.emailAddress,
        decoration: decoration().textFormDecoration('이메일 형식에 맞게 입력', '이메일'),
        onChanged: (dynamic val) {
          email = val;
        },
        onSaved: (value) {
          email = value!;
        },
      ),
    );
  }

  Widget searchMember() {
    // 계정찾기
    return Expanded(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) {
                  return searchAccount();
                }),
          );
        },
        child: Text('계정찾기'),
        style: TextButton.styleFrom(
          primary: Colors.black,
          alignment: Alignment.bottomLeft,
        ),
      ),
    );
  }

  Widget joinMember() {
    // 회원가입
    return Expanded(
      child: SizedBox(
        width: 1.0,
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) {
                    return joinPage();
                  }),
            );
          },
          child: Text('회원가입'),
          style: TextButton.styleFrom(
            primary: Colors.black,
            alignment: Alignment.bottomRight, //글자위치 변경
          ),
        ),
      ),
    );
  }
}
