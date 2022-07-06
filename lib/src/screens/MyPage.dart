import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'LoginBeforeScreen.dart';

class myPage extends StatefulWidget {
  const myPage({Key? key}) : super(key: key);

  @override
  State<myPage> createState() => _myPageState();
}

class _myPageState extends State<myPage> {
  final emailEditingController = TextEditingController();
  FirebaseFirestore fireStore=FirebaseFirestore.instance;
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  bool languageButton = false;
  bool checkEmail = false;
  String email = '';
  String codeDialog = '';
  final authentification = FirebaseAuth.instance;
  User? loggedUser;
  String userEmail = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    final user = await authentification.currentUser;
    try {
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
        userEmail = loggedUser!.email!;
      }
      else{
        print(user);
      }
    }catch(error){
      print(error);
    }
  }

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
      body: StreamBuilder(
        stream : FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return loginBeforeScreen();
        }
        else{
          return  SingleChildScrollView(
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
                          subtitle: new Text(userEmail),
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
                            changePassword();
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
                            logout();
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
                              removeUser();
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
      );
  }
}
    ),
      bottomNavigationBar: BottomAppBar(),
    );
  }

  void removeUser()  {
    showDialog(
      context: context,
      barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Row(
            children: <Widget>[
               Expanded(
                child: TextFormField(
                  key : emailFormKey,
                  controller : emailEditingController,
                  autofocus: true,
                  decoration: textDecoration(
                      '',
                      'Please type your Email to confirm.',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (dynamic val) {
                    email = val;
                    if(emailEditingController.text == userEmail){
                      checkEmail = true;
                    }
                    else checkEmail = false;
                  },
                  validator: (value) =>
                      emailCheck(value.toString()),
                ),
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
                child: const Text('회원탈퇴'),

                onPressed: () async {
                  if(checkEmail){
                    try {
                      //await FirebaseAuth.instance.currentUser?.delete();
                      /*
                      await FirebaseFirestore.instance
                          .collection('User')
                          .get()
                          .then((snapShot) {
                        snapShot.docs.forEach((element) {
                          if(element["email"] == userEmail){
                            print(snapShot.docs);
                            fireStore.collection('User').doc().delete();
                            print(fireStore.collection('User').doc());
                          }
                        });
                      });
                      */
                    } catch (e) {
                      print(e);
                    }
                    Navigator.pop(context);
                  }
                }),

            FlatButton(
                child: const Text('닫기'),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        );
      },
    );
  }



  bool checkEmailValidate(){

    final isValid = emailFormKey.currentState!.validate();
    if(isValid){
      emailFormKey.currentState!.save();
    }
    return isValid;
  }


    String? emailCheck(String value) {
      if (value.isEmpty) {
        return '이메일을 입력해주세요'.tr();
      } else {
        if (userEmail != value) {
          return 'Check your email';
        } else {
          print(3);
          return null;
        }
      }
    }

  void sendEmailMessage(){
    showDialog(
      context: context,
      barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title : Text('안내메시지'),
          content: Text('이메일로 비밀번호 변경링크를 보냈습니다.'),
          actions: <Widget>[
            FlatButton(
                child: const Text('확인'),
                onPressed: () async {
                  Navigator.pop(context);
                }),
          ],
        );
      },
    );
  }

  void changePassword(){
    showDialog(
      context: context,
      barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Text('비밀번호를 변경하시겠습니까?'),
          actions: <Widget>[
            new FlatButton(
                child: const Text('예'),
                onPressed: () {
                  Navigator.pop(context);
                  sendEmailMessage();
                  authentification.sendPasswordResetEmail(email: userEmail); // 비밀번호 재전송하기
                  //Navigator.pop(context);
                }),
            new FlatButton(
                child: const Text('아니오'),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        );
      },
    );
  }

  void logout(){
    showDialog(
      context: context,
      barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Text('로그아웃 하시겠습니까?'),
          actions: <Widget>[
            new FlatButton(
                child: const Text('예'),
                onPressed: () {
                  Navigator.pop(context);
                  authentification.signOut();
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          return homePage();
                        }),
                  );
                }),
            new FlatButton(
                child: const Text('아니오'),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        );
      },
    );
  }

  InputDecoration textDecoration(hintText, labelText) {
// 텍스트 필드 꾸미기
    return new InputDecoration(
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.0,
          )),
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
