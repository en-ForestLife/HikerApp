import 'package:flutter/material.dart';
import '../utils/checkInformation.dart';
import '../utils/inputDecoration.dart';

class joinWidgets extends StatefulWidget {
  joinWidgets({Key? key}) : super(key: key);

  String id='';
  @override
  State<joinWidgets> createState() => joinWidgetsState();
}

class joinWidgetsState extends State<joinWidgets> {

  final passwordEditingController = TextEditingController();
  //bool valuefirst = false;
  //bool valuesecond = false;

  String id = '';
  String password = '';
  String email = '';
  String name = '';
  String birth = '';
  String sex = '';

  var message = '';
  String check = "";

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget idInput() {
    // 아이디 위젯
    return SizedBox(
      height: 80,
      child: TextFormField(
        key : ValueKey(1),
        keyboardType: TextInputType.text,
        decoration: decoration().textFormDecoration('영문 + 숫자 조합 4~12자', '아이디'),
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
        decoration().textFormDecoration('영문 대.소문자 + 숫자 + 특수문자 조합 8~15자', '비밀번호'),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (dynamic val) {
          password = val;
          print(password);
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
        decoration: decoration().textFormDecoration('비밀번호를 다시 입력해주세요', '비밀번호 확인'),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (dynamic val) {
          print(val);
          print(passwordEditingController.text);
          //print(password);
        },
        validator: (value) {
          if (value == '') {
            return '비밀번호를 입력하세요';
          }
          else if (value.toString() != passwordEditingController.text.toString()) {
            return '비밀번호가 일치하지 않습니다.';
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
        decoration: decoration().textFormDecoration('이메일 형식에 맞게 입력', '이메일'),
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
        decoration().textFormDecoration('실명입력', '이름'),
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
        decoration().textFormDecoration('ex) 1999-08-20', '생년월일'),
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



