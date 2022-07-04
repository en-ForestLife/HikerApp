import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';
import 'package:hiker/src/model/forestInformation.dart';
import '../controller/forestInformationController.dart';
import 'package:hiker/src/controller/forestInformationController.dart';
import 'package:hiker/src/main/ForestListSquare.dart';

void runMainPage() {
  runApp(MainPage());
}

String searchedName = '';

String getMountainName() {
  print("hello $searchedName hi");
  return searchedName;
}

class MainPage extends GetView<ForestInformationController> {
  //const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var information = controller.forestInformation.value;

    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: ForestSearchingHeader(),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                    itemBuilder: (context, index) {
                      return ForestListSquare(index);
                    }),
              )
            ],
          ),
        )
    );
  }
}

/////// 상단 검색바 ////////
TextEditingController textEditingController = TextEditingController(); // 검색 컨트롤러

eraseTextField() { // 검색창에서 x 누르면 검색 취소
  textEditingController.clear();
}

forestSearchingDetail(mountainName) {
  print(mountainName);
  searchedName = mountainName.toString();
}

AppBar ForestSearchingHeader() { // 상단 검색창
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
        ),
        onFieldSubmitted: forestSearchingDetail,
      )
  );
}



