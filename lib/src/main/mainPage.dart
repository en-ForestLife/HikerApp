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
        body: getList(),
      )
    );
  }
//Container(
//           padding: const EdgeInsets.all(25),
//           child: Obx((){
//             var information = controller.forestInformation.value;
//             return Column(
//               children: [
//                 informationWidget("산이름", information.mntnnm ?? ''),
//               ],
//             );
//           }),
//         ),
  Widget getList() {
    return ListView.builder(itemBuilder: (context, index) {
      return getCard();
    });
  }

  Widget getCard() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
      child: ListTile(
        title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget> [
            Image.network("https://a.cdn-hotels.com/gdcs/production1/d1156/f6d7ba6d-b1b2-4cc6-bc62-9cef6e70db29.jpg?impolicy=fcrop&w=800&h=533&q=medium"),
            Text('한라산', style: TextStyle(fontSize:19, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
            Text('화산이 잉태한 남한 최고(最高)의 영산', style: TextStyle(fontSize:14)),
            Text('제주도 제주시, 서귀포시', style: TextStyle(fontSize:14)),
            Text('1947m', style: TextStyle(fontSize:14)),
            Container(
              width:10,
              height:10,
              //alignment: Alignment.centerLeft,
            )
          ]
        )
      )
    )
    );
  }

  Widget informationWidget(String title, String value) {
    return Row (
      children: [
        Text (
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Text (
          " : $value",
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }

}

/////// 상단 검색바 ////////

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



