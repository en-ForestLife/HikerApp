import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiker/src/controller/translateLanguage.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../utils/inputDecoration.dart';
import 'HomePage.dart';

import 'joinPageScreen.dart';
import 'memberSearch.dart';

class loginPage extends StatefulWidget {
  loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final authentification = FirebaseAuth.instance;
  FirebaseFirestore fireStore=FirebaseFirestore.instance;
  translateLanguage lan = translateLanguage();


  bool loddingSpinner = false;
  User? loggedUser;
  String password = '';
  String email = '';
  String id ='';
  bool languageButton = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'login'.tr(),
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
        actions:[
          OutlinedButton.icon( // 언어 바꿀 수 있는 버튼
            onPressed: () {
              // 영어로 언어 변경
              // 이후 앱을 재시작하면 영어로 동작
              if(!languageButton){ // 영어
                EasyLocalization.of(context)!.setLocale(Locale('en'));
                languageButton = true;
              }
              else{ // 한국어
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
      body: ModalProgressHUD( // 로그인 할 때 로딩스피너
        inAsyncCall: loddingSpinner, // 로그인 할 때 로딩스피너
        child : SingleChildScrollView(
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

                          idInput(), // 이메일 입력
                          passwordInput(), // 비밀번호
                          Padding(
                            // 로그인 버튼이랑 텍스트 필드 사이 공간
                            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                          ),

                          Container(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                setState((){
                                  loddingSpinner = true;// 로그인 할 때 로딩스피너보이게함
                                });
                                await FirebaseFirestore.instance
                                    .collection('User')
                                    .get()
                                    .then((snapShot) {
                                  snapShot.docs.forEach((element) {
                                    if(element["id"] == id){
                                      email = element["email"];
                                      return;
                                    }
                                  });
                                });
                                try {
                                  final loggedUser = await authentification
                                      .signInWithEmailAndPassword( // 로그인 메서드
                                      email: email,
                                      password: password
                                  );
                                  final user = loggedUser;
                                  if (loggedUser.user != null) { // 로그인 되었을 때
                                    movePage(); // 로그인 되었을 때 페이지 이동함
                                  }
                                } catch (error) {
                                  print(error);
                                  errorMessage(); // 로그인 안되면 회원정보 일치하지 않습니다. 라고 알림창 뜸
                                }
                                setState((){
                                  loddingSpinner = false; // 로딩스피너 꺼짐
                                });
                              },
                              child: Text('login'.tr()),
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
            .textFormDecoration('passwordInput'.tr(), 'password'.tr()),
        onChanged: (dynamic val) {
          password = val;
        },
        onSaved: (value) {
          password = value!;
        },
        obscureText: true,
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
        child: Text('searchAccount'.tr()),
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
          child: Text('joinButton'.tr()),
          style: TextButton.styleFrom(
            primary: Colors.black,
            alignment: Alignment.bottomRight, //글자위치 변경
          ),
        ),
      ),
    );
  }

  void movePage(){ // 로그인 후 페이지 이동
    showDialog(
      context: context,
      barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text('Notification'.tr()),
          content: Text('doneLogin'.tr()),
          actions: <Widget>[
            FlatButton(
              child: Text('close'.tr()),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) {
                        return homePage();
                      }),
                );
              },
            ),
          ],
        );
      },
    );
  }
  Widget idInput() {
    // 아이디 위젯
    return SizedBox(
      height: 80,
      child: TextFormField(
        key : ValueKey(1),
        keyboardType: TextInputType.text,
        decoration: decoration().textFormDecoration('idInput'.tr(), 'id'.tr()),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (dynamic val) {
          id = val;
        },
        onSaved : (value){
          id = value!;
        },
      ),
    );
  }

  void errorMessage(){
    showDialog(
      context: context,
      barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text('Notification'.tr()),
          content: Text('wrongPassword'.tr()),
          actions: <Widget>[
            FlatButton(
              child: Text('close'.tr()),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}