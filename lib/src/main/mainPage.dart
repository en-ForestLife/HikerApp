import 'package:flutter/material.dart';

void mainPage() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (
      backgroundColor: Colors.white,
      appBar: searchMountainHeader() //
      )
    );
  }

}

TextEditingController textEditingController = TextEditingController(); // 검색 컨트롤러

eraseTextField() { // 검색창에서 x 누르면 검색 취소
  textEditingController.clear();
}

AppBar searchMountainHeader() { // 상단 검색창
  return AppBar(
      backgroundColor: Colors.white,
      title: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: '어디로 가볼까요?',
          hintStyle: TextStyle(
            color:Colors.black,
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black,)
          ),
          filled: true,
          prefixIcon: Icon(Icons.search, color: Colors.black),
          suffixIcon: IconButton(icon: Icon(Icons.clear), color: Colors.black, onPressed: eraseTextField,),
        ),
        style: TextStyle(
          fontSize: 15,
          color: Colors.black,
        )
      )

  );
}


