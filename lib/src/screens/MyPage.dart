import 'package:cloud_firestore/cloud_firestore.dart';
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
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      child: Card(
                        color: Colors.red,
                        child: ListTile(
                          //contentPadding: EdgeInsets.symmetric(vertical: 18.0),
                          contentPadding: EdgeInsets.all(25.0),
                          leading: Icon(
                            Icons.person,
                            color: Colors.grey[850],
                          ),
                          title: Text(
                            '조준희',
                            style: TextStyle(
                              color: Colors.black, // 글자 색상 검정색
                              fontSize: 20.0, // 폰트 사이즈
                            ),
                          ),
                          //subtitle: new Text("설명"),
                          onTap: () {
                            print('Home pressed');
                          },
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),

                    //SizedBox(height: 70),

                    Container(
                      height: 100,
                      child: Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(25.0),
                          leading: Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.grey[850],
                          ),
                          title: Text(
                            '이벤트 배너',
                            style: TextStyle(
                              color: Colors.black, // 글자 색상 검정색
                              fontSize: 20.0, // 폰트 사이즈
                            ),
                          ),
                          onTap: () {
                            print('Home pressed');
                          },
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),

                    Container(
                      height: 100,
                      child: Card(
                        child: ListTile(
                          //contentPadding: EdgeInsets.symmetric(vertical: 18.0),
                          contentPadding: EdgeInsets.all(25.0),
                          leading: Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.grey[850],
                          ),
                          title: Text(
                            '위시리스트',
                            style: TextStyle(
                              color: Colors.black, // 글자 색상 검정색
                              fontSize: 20.0, // 폰트 사이즈
                            ),
                          ),
                          onTap: () {
                            print('Home pressed');
                          },
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),

                    Container(
                      height: 100,
                      child: Card(
                        child: ListTile(
                          //contentPadding: EdgeInsets.symmetric(vertical: 18.0),
                          contentPadding: EdgeInsets.fromLTRB(25.0, 13.0, 25.0, 0.0),
                          leading: Icon(
                            Icons.email_outlined,
                            color: Colors.grey[850],
                          ),
                          title: Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.black, // 글자 색상 검정색
                              fontSize: 20.0, // 폰트 사이즈
                            ),
                          ),
                          subtitle: new Text("zzuni3423@naver.com"),
                          onTap: () {
                            print('Home pressed');
                          },
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),

                    Container(
                      height: 100,
                      child: Card(
                        child: ListTile(
                          //contentPadding: EdgeInsets.symmetric(vertical: 18.0),
                          contentPadding: EdgeInsets.all(25.0),
                          leading: Icon(
                            Icons.published_with_changes_outlined,
                            color: Colors.grey[850],
                          ),
                          title: Text(
                            '비밀번호 변경',
                            style: TextStyle(
                              color: Colors.black, // 글자 색상 검정색
                              fontSize: 20.0, // 폰트 사이즈
                            ),
                          ),
                          onTap: () {
                            print('Home pressed');
                          },
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),

                    Container(
                      height: 100,
                      child: Card(
                        child: ListTile(
                          //contentPadding: EdgeInsets.symmetric(vertical: 18.0),
                          contentPadding: EdgeInsets.all(25.0),
                          leading: Icon(
                            Icons.help_outline,
                            color: Colors.grey[850],
                          ),
                          title: Text(
                            '도움말',
                            style: TextStyle(
                              color: Colors.black, // 글자 색상 검정색
                              fontSize: 20.0, // 폰트 사이즈
                            ),
                          ),
                          onTap: () {
                            print('Home pressed');
                          },
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),

                    Container(
                      height: 100,
                      child: Card(
                        child: ListTile(
                          //contentPadding: EdgeInsets.symmetric(vertical: 18.0),
                          contentPadding: EdgeInsets.all(25.0),
                          leading: Icon(
                            Icons.report_gmailerrorred_outlined,
                            color: Colors.grey[850],
                          ),
                          title: Text(
                            '정보',
                            style: TextStyle(
                              color: Colors.black, // 글자 색상 검정색
                              fontSize: 20.0, // 폰트 사이즈
                            ),
                          ),
                          onTap: () {
                            print('Home pressed');
                          },
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),

                    Container(
                      height: 100,
                      child: Card(
                        child: ListTile(
                          //contentPadding: EdgeInsets.symmetric(vertical: 18.0),
                          contentPadding: EdgeInsets.all(25.0),
                          leading: Icon(
                            Icons.logout,
                            color: Colors.grey[850],
                          ),
                          title: Text(
                            '로그아웃',
                            style: TextStyle(
                              color: Colors.black, // 글자 색상 검정색
                              fontSize: 20.0, // 폰트 사이즈
                            ),
                          ),
                          onTap: () {
                            print('Home pressed');
                          },
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),

                    SizedBox(height: 30),

                    Container(
                      height: 100,
                      child: Card(
                        child: ListTile(
                          //contentPadding: EdgeInsets.symmetric(vertical: 18.0),
                          contentPadding: EdgeInsets.all(25.0),
                          leading: Icon(
                            Icons.person_off_outlined,
                            color: Colors.grey[850],
                          ),
                          title: Text(
                            '회원탈퇴',
                            style: TextStyle(
                              color: Colors.black, // 글자 색상 검정색
                              fontSize: 20.0, // 폰트 사이즈
                            ),
                          ),
                          onTap: () {
                            print('Home pressed');
                          },
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
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

  /*
  void checkIdAndSSendEmail() async{ // 아이디 체크 후 이메일 반환
    await FirebaseFirestore.instance
        .collection('User')
        .get()
        .then((snapShot) {
      snapShot.docs.forEach((element) {
        if(element["id"] == id){
          email = element["email"];
          auth.sendPasswordResetEmail(email: email); // 비밀번호 재전송하기
          message = 'sendEmail'.tr();
          checkUser = true;
        }
      });
    });
  }
   */
}
