import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class CheckValidate {

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'emailInput'.tr();
    } else {
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = RegExp(pattern.toString());
      if (!regExp.hasMatch(value)) {
        return 'ex) test123@naver.com';
      } else {
        return null;
      }
    }
  }

  String? validatePassword(String value){
    if(value.isEmpty){
      return 'blankPassword'.tr();
    }else {
      Pattern pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$';
      RegExp regExp = RegExp(pattern.toString());
      if(!regExp.hasMatch(value)){
        return 'passwordInput'.tr();
      }else{
        return null;
      }
    }
  }

  String? validateId(String value){
    if(value.isEmpty){
      return 'blankId'.tr();
    }else {
      Pattern pattern = r'^[a-z]{1}[a-z0-9]{4,12}$';
      RegExp regExp = RegExp(pattern.toString());
      
      if(!regExp.hasMatch(value)){
        return 'idInput'.tr();
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
      RegExp regExp = RegExp(pattern.toString());

      if(!regExp.hasMatch(value)){
        return 'blankName'.tr();
      }else{
        return null;
      }
    }
  }

  String? validateBirth(String value){
    if(value.isEmpty){
      return 'blankBirth'.tr();
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