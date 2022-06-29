import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';
import 'package:hiker/src/controller/forestInformationController.dart';

void runMainPage() {
  runApp(const MainPage());
}

class MainPage extends GetView<ForestInformationController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (
        backgroundColor: Colors.white,
        appBar: ForestSearchingHeader(),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Obx((){
            var information = controller.forestInformation.value;
            return Column(
              children: [
                Row(children: [
                  Text(
                    "산 이름 : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    " : ${information.mntnnm}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],)
              ],
            );
          }),
        ),
      )
    );
  }

}

TextEditingController textEditingController = TextEditingController(); // 검색 컨트롤러

eraseTextField() { // 검색창에서 x 누르면 검색 취소
  textEditingController.clear();
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
        )
      )
  );
}



