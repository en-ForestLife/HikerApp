import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../utils/checkInformation.dart';
import '../utils/inputDecoration.dart';
import 'loginPageScreen.dart';

class joinPage extends StatefulWidget {
  const joinPage({Key? key}) : super(key: key);

  @override
  State<joinPage> createState() => _joinPage();
}

class _joinPage extends State<joinPage> {
  final auth = FirebaseAuth.instance;
  FirebaseFirestore fireStore=FirebaseFirestore.instance;

  final passwordEditingController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //bool valuefirst = false;
  //bool valuesecond = false;

  String id = '';
  String password = '';
  String email = '';
  String name = '';
  String birth = '';

  var message = '';
  String check = '';

  bool loddingSpinner = false;
  bool languageButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'joinMember'.tr(),
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
                        idInput(), // 아이디
                        Email(), // 이메일 입력
                        passwordInput(), // 비밀번호
                        passwordCheck(), // 비밀번호 체크
                        nameInput(), // 이름 입력
                        birthInput(), // 생일 입력
                      ],
                    ),
                  ), //아이디 비밀번호 레이아웃
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: ModalProgressHUD(
        inAsyncCall: loddingSpinner,
        child : BottomAppBar(
          // 밑에 하단바(회원가입 버튼)
          child: Container(
            height: 50,
            child: ElevatedButton(
              onPressed: () async{

                //auth.currentUser?.sendEmailVerification();
                if(checkValidation()){ // 회원정보 다 채움
                  setState((){
                    loddingSpinner = true;// 로그인 할 때 로딩스피너보이게함
                  });
                  checkIdAndEmail(); // 아이디 이메일 중복 체크 후 회원가입
                }
              },
              child: Text('joinButton'.tr()),
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // 버튼색상
                onPrimary: Colors.white, // 글자색상
              ),
            ),),
        ),
      ),
    );
  }

  void overlap(){ // 아이디 또는 이메일 중복있을 시 메시지
    setState((){
      loddingSpinner = false;// 로그인 할 때 로딩스피너보이게함
    });
    showDialog(
      context: context,
      barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text('Notification'.tr()),
          content: Text(message),
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

  bool checkValidation(){
    final isValid = formKey.currentState!.validate();
    if(isValid){
      formKey.currentState!.save();
    }
    return isValid;
  }

  void sucessJoin() async{
    try {
      // final newUser =
       await auth
          .createUserWithEmailAndPassword( // 회원가입 메서드
          email: email,
          password: password
      );
    }catch(error){
      print(error);
    }

    await fireStore.collection('Users').doc().set(
        { // 데베에 정보 저장
          "id": id,
          "email": email,
          "password": password,
          "name": name,
          "birth": birth,
        });
    setState((){
      loddingSpinner = false;// 로그인 할 때 로딩스피너보이게함
    });
    showDialog(
      context: context,
      barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text('Notification'.tr()),
          content: Text('createAccount'.tr()),
          actions: <Widget>[
            FlatButton(
              child: Text('close'.tr()),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context){
                        return loginPage();
                      }),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void checkIdAndEmail() async{
    int checkUser = 0;
    await fireStore // 아이디, 이메일 중복체크인데 for문으로 찾아서 where로 찾을 수 있나 찾아봐야함
        .collection('User')
        .get()
        .then((snapShot){
      snapShot.docs.forEach((element) {
        if(element["id"] == id){
          checkUser = 1;
          check = 'idOverlap';
          message = 'idMessage'.tr();
        }
        else if(element["email"] == email){
          checkUser = 2;
          check = 'emailOverlap';
          message = 'emailMessage'.tr();
        }
      });
    });
    if(checkUser == 0) {
      check = "pass";
      message = 'createAccount'.tr();
      sucessJoin();
    }
    else if(checkUser == 1 || checkUser == 2){
      overlap();
    }
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
        validator: (value) =>
            CheckValidate().validateId(value.toString()),
        onSaved : (value){
          id = value!;
        },
      ),
    );
  }

  Widget passwordInput() {
    // 비밀번호 위젯
    return SizedBox(
      height: 80,

      child: TextFormField(
        key : ValueKey(2),
        keyboardType: TextInputType.text,
        controller: passwordEditingController,
        decoration:
        decoration().textFormDecoration('passwordInput'.tr(), 'password'.tr()),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (dynamic val) {
          password = val;
        },
        validator: (value) =>
            CheckValidate().validatePassword(value.toString()),
        onSaved : (value){
          password = value!;
        },
        obscureText:true,
      ),

    );
  }

  Widget passwordCheck() {
    // 비밀번호 확인 위젯
    return SizedBox(
      height: 80,

      child: TextFormField(
        key : ValueKey(3),
        keyboardType: TextInputType.text,
        decoration: decoration().textFormDecoration('repasswordInput'.tr(), 'passwordCheck'.tr()),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (dynamic val) {},
        validator: (value) {
          if (value == '') {
            return 'blankPassword'.tr();
          }
          else if (value.toString() != passwordEditingController.text.toString()) {
            return 'wrongPassword'.tr();
          } else {
            return null;
          }
        },
        obscureText:true,
      ),

    );
  }

  Widget Email() {
    // 이메일 위젯
    return SizedBox(
      height: 80,

      child: TextFormField(
        key : ValueKey(4),
        keyboardType: TextInputType.emailAddress,
        decoration: decoration().textFormDecoration('ex) test123@naver.com', 'Email'),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (dynamic val) {
          email = val;
        },
        validator: (value) =>
            CheckValidate().validateEmail(value.toString()),
        onSaved : (value){
          email = value!;
        },
      ),
    );
  }

  Widget nameInput() {
    // 이름 위젯
    return SizedBox(
      height: 80,
      child: TextFormField(
        key : ValueKey(5),
        keyboardType: TextInputType.text,
        decoration:
        decoration().textFormDecoration('nameInput'.tr(), 'name'.tr()),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (dynamic val) {
          name = val;
        },
        validator: (value) =>
            CheckValidate().validateName(value.toString()),
        onSaved : (value){
          name = value!;
        },
      ),

    );
  }

  Widget birthInput() {
    // 생년월일 위젯
    return SizedBox(
      height: 80,

      child: TextFormField(
        key : ValueKey(6),
        keyboardType: TextInputType.text,
        decoration:
        decoration().textFormDecoration('ex) 1999-08-20', 'birth'.tr()),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (dynamic val) {
          birth = val;
        },
        validator: (value) =>
            CheckValidate().validateBirth(value.toString()),
        onSaved : (value){
          birth = value!;
        },
      ),
    );
  }
}