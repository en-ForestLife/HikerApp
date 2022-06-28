import 'package:flutter/cupertino.dart';

class CheckValidate {
  String? validateEmail(FocusNode focusNode, String value) {
    if (value.isEmpty) {
      focusNode.requestFocus();
      return '이메일을 입력하세요.';
    } else {
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern.toString());
      if (!regExp.hasMatch(value)) {
        focusNode.requestFocus(); //포커스를 해당 textformfield에 맞춘다.
        return '잘못된 이메일 형식입니다.';
      } else {
        return null;
      }
    }
  }

  String? validatePassword(String value){
    if(value.isEmpty){
      return '비밀번호를 입력하세요.';
    }else {
      Pattern pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$';
      RegExp regExp = new RegExp(pattern.toString());
      if(!regExp.hasMatch(value)){
        return '특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내로 입력하세요.';
      }else{
        return null;
      }
    }
  }

  String? validateId(String value){
    if(value.isEmpty){
      return '아이디를 입력하세요.';
    }else {
      Pattern pattern = r'^[a-z]{1}[a-z0-9]{4,12}$';
      RegExp regExp = new RegExp(pattern.toString());
      
      if(!regExp.hasMatch(value)){
        return '영문 + 숫자 조합 4~12자';
      }else{
        return null;
      }
    }
  }

  String? validateName(String value){
    if(value.isEmpty){
      return '이름을 입력하세요.';
    }else {
      Pattern pattern = r'^[가-힣]{2,4}$';
      RegExp regExp = new RegExp(pattern.toString());

      if(!regExp.hasMatch(value)){
        return '한글2~5자';
      }else{
        return null;
      }
    }
  }

  String? validateBirth(String value){
    if(value.isEmpty){
      return '생년월일을 입력하세요.';
    }else {
      Pattern pattern = r'^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$';
      RegExp regExp = new RegExp(pattern.toString());

      if(!regExp.hasMatch(value)){
        return 'ex) 1999-08-20';
      }else{
        return null;
      }
    }
  }
}