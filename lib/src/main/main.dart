import 'dart:js';

import 'package:flutter/material.dart';

import '../utils/checkInformation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: joinPage());
  }
}

class joinPage extends StatefulWidget {
  // 회원가입 페이지
  @override
  _joinPage createState() => _joinPage();
}

//joinPage({Key? key}) : super(key: key); // 원래 const jounPage였음
class _joinPage extends State<joinPage> {
  bool valuefirst = false;
  bool valuesecond = false;

  FocusNode _emailFocus = new FocusNode();
  FocusNode _passwordFocus = new FocusNode();
  TextEditingController emailEditingController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '회원정보 입력 및 동의',
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
        child : Stack(
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
                child: Theme(
                  // 왜 스타일 적용 안되냐
                  data: ThemeData(
                      primaryColor: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(
                        fontSize: 15,
                      ))),

                  key: formKey,
                  child: Column(
                    children: [
                      idInput(), // 아이디
                      passwordInput(), // 비밀번호
                      passwordCheck(), // 비밀번호 체크
                      Email(), // 이메일 입력
                      nameInput(), // 이름 입력
                      SizedBox(height: 30), // 중간에 공간
                      birthInput(),
                      Container(
                        color: Colors.white,
                        height: 50,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                            ),
                            Expanded(
                              // 비율조정
                              flex: 10,
                              child: Text(
                                '성별',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              // 비율조정
                              child: Text(
                                '남자',
                                style: TextStyle(fontSize: 17.0),
                              ),
                            ),
                            Checkbox(
                              checkColor: Colors.greenAccent,
                              activeColor: Colors.red,
                              value: this.valuefirst,
                              onChanged: (value) {
                                if (!this.valuesecond) // 남녀 하나만 선택
                                  setState(() {
                                    this.valuefirst = value!;
                                  });
                              },
                            ),
                            Text(
                              '여자',
                              style: TextStyle(fontSize: 17.0),
                            ),
                            Checkbox(
                              value: this.valuesecond,
                              onChanged: (value) {
                                if (!this.valuefirst) // 남녀 하나만 선택
                                  setState(() {
                                    this.valuesecond = value!;
                                  });
                              },
                            ),
                          ],
                        ),
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

      bottomNavigationBar: BottomAppBar(
        // 밑에 하단바(회원가입 버튼)
        child: Container(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                formKey.currentState?.validate();
                /*
                  showDialog(
                    context: context,
                    barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
                    builder: (BuildContext context) {
                      // return object of type Dialog
                      return AlertDialog(
                        title: Text("안내메시지"),
                        content: Text("회원가입이 완료되었습니다!"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("닫기"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                  */
              },
              child: Text("회원가입"),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey, // 버튼색상
                onPrimary: Colors.black, // 글자색상
              ),
            )),
      ),
    );
  }

  Widget idInput() {
    // 아이디 위젯
    return SizedBox(
      height: 70,
      child: Flexible(
        child: TextFormField(
          controller: emailEditingController,
          keyboardType: TextInputType.emailAddress,
          decoration: _textFormDecoration('영문 + 숫자 조합 4~12자', '아이디'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (dynamic val) {},
          validator: (value) =>
              CheckValidate().validateEmail(_emailFocus, value.toString()),
        ),
      ),
    );
  }

  Widget passwordInput() {
    // 비밀번호 위젯
    return SizedBox(
      height: 70,
      child: Flexible(
        child: TextFormField(
          controller: emailEditingController,
          keyboardType: TextInputType.emailAddress,
          decoration:
              _textFormDecoration('영문 대.소문자 + 숫자 + 특수문자 조합 8~15자', '비밀번호'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (dynamic val) {},
          validator: (value) =>
              CheckValidate().validateEmail(_emailFocus, value.toString()),
        ),
      ),
    );
  }

  Widget passwordCheck() {
    // 비밀번호 확인 위젯
    return SizedBox(
      height: 70,
      child: Flexible(
        child: TextFormField(
          controller: emailEditingController,
          keyboardType: TextInputType.emailAddress,
          decoration: _textFormDecoration('비밀번호 확인', '비밀번호'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (dynamic val) {},
          validator: (value) =>
              CheckValidate().validateEmail(_emailFocus, value.toString()),
        ),
      ),
    );
  }

  Widget Email() {
    // 이메일 위젯
    return SizedBox(
      height: 70,
      child: Flexible(
        child: TextFormField(
          controller: emailEditingController,
          keyboardType: TextInputType.emailAddress,
          decoration: _textFormDecoration('이메일 형식에 맞게 입력', '이메일'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (dynamic val) {},
          validator: (value) =>
              CheckValidate().validateEmail(_emailFocus, value.toString()),
        ),
      ),
    );
  }

  Widget nameInput() {
    // 이름 위젯
    return SizedBox(
      height: 70,
      child: Flexible(
        child: TextFormField(
          controller: emailEditingController,
          keyboardType: TextInputType.emailAddress,
          decoration:
          _textFormDecoration('실명입력', '이름'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (dynamic val) {},
          validator: (value) =>
              CheckValidate().validateEmail(_emailFocus, value.toString()),
        ),
      ),
    );
  }

  Widget birthInput() {
    // 생년월일 위젯
    return SizedBox(
      height: 70,
      child: Flexible(
        child: TextFormField(
          controller: emailEditingController,
          keyboardType: TextInputType.emailAddress,
          decoration:
          _textFormDecoration('990820', '생년월일'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (dynamic val) {},
          validator: (value) =>
              CheckValidate().validateEmail(_emailFocus, value.toString()),
        ),
      ),
    );
  }

  InputDecoration _textFormDecoration(hintText, labelText) {
    // 텍스트 필드 꾸미기
    return new InputDecoration(
      focusedBorder: UnderlineInputBorder(
        // 해당 포커스 밑줄 파란색에서 검은색으로 변경
        borderSide: BorderSide(
          color: Colors.black,
        ),
      ),
      contentPadding: EdgeInsets.all(8),
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: 14,
        color: Colors.grey,
      ),
      labelText: labelText,
      labelStyle: TextStyle(
        color: Colors.black, // 포커스 갔을 때 텍스트 파란색에서 검정색으로 변경
      ),
      filled: true,
      fillColor: Colors.white,
    );
  }

  Widget EmailInput() {
    return Flexible(
      child: TextFormField(
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            // 해당 포커스 밑줄 파란색에서 검은색으로 변경
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          labelText: '이메일',
          labelStyle: TextStyle(
            color: Colors.black, // 포커스 갔을 때 텍스트 파란색에서 검정색으로 변경
          ),
          hintText: '이메일 형식에 맞게 입력',
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
