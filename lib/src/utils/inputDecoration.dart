import 'package:flutter/material.dart';

class decoration {

  InputDecoration textFormDecoration(hintText, labelText) {
// 텍스트 필드 꾸미기
    return new InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.black,
        width: 1.0,
      )),
      focusedBorder: OutlineInputBorder(
// 해당 포커스 밑줄 파란색에서 검은색으로 변경
        borderSide: BorderSide(
          color: Colors.teal,
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
}
