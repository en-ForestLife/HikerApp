import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/inputDecoration.dart';
import 'loginPageScreen.dart';

class searchAccount extends StatefulWidget {
  const searchAccount({Key? key}) : super(key: key);

  @override
  State<searchAccount> createState() => _searchAccountState();
}

class _searchAccountState extends State<searchAccount> {
  @override
  String password = '';
  String email = '';
  String id = '';
  bool isIdScreen = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '아이디 찾기 / 비밀번호 찾기',
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
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white), // 테두리
                    borderRadius: BorderRadius.circular(5), //모서리 둥글게
                  ),

                  child: Row(
                    children: [

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isIdScreen = true;
                          });
                        },
                            child :Padding( // 아이디 찾기
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text('아이디찾기',
                                  style:
                                  TextStyle(
                                      color : !isIdScreen ? Colors.grey : Colors.white,
                                      fontSize: 18),
                              ),
                            ),
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isIdScreen = false;
                          });
                      },
                            child : Padding( // 비밀번호 찾기
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                '비밀번호찾기',
                                style: TextStyle(
                                  color : isIdScreen ? Colors.grey : Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],),
            SizedBox(
              height: 30,
            ),
            if(isIdScreen)
              Container(
                width: MediaQuery.of(context).size.width - 40,
                child:Column(
                  children:[
                    Email(),
                    idInput(),
                    Container( // 아이디 찾기 버튼
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                          child: Text("아이디 찾기"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black, // 버튼색상
                          onPrimary: Colors.white, // 글자색상
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if(!isIdScreen)
              Container(
                width: MediaQuery.of(context).size.width - 40,
                child:Column(
                  children:[
                    Email(),
                    passwordInput(),
                    Container( // 비밀번호 찾기 버튼
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("비밀번호 찾기"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black, // 버튼색상
                          onPrimary: Colors.white, // 글자색상
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ],),
      ),
      bottomNavigationBar: BottomAppBar(),
      );
  }

  Widget idInput() {
    // 아이디 위젯
    return SizedBox(
      height: 80,
      child: TextFormField(
        key : ValueKey(1),
        keyboardType: TextInputType.text,
        decoration: decoration().textFormDecoration('영문 + 숫자 조합 4~12자', '아이디'),
        onChanged: (dynamic val) {
          id = val;
        },
        onSaved : (value){
          id = value!;
        },
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
}