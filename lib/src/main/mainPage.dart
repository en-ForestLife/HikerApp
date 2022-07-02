import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';

import 'package:hiker/src/model/forestInformationJson.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'dart:convert' as convert;

import 'package:hiker/src/controller/forestInformationController.dart';
import 'package:hiker/src/main/ForestListSquare.dart';


void runMainPage() {
  runApp(MainPage());
}

class MainPage extends GetView<ForestInformationController> {
  //const MainPage({Key? key}) : super(key: key);
  final forestJsonInformation = <ForestInformationJsonModel>[];

  // Xml to Json
  Future<List<ForestInformationJsonModel>> fetchForestJson() async {
    final forestJsonInformation = <ForestInformationJsonModel>[];
    final url = Uri.parse('http://openapi.forest.go.kr/openapi/service/trailInfoService/getforeststoryservice?key=WRW8U5mI32TQ7scwZY7OauPpIOPTEz2o5RcdqnpvaCWeow/zFQ3xRp7uciHXufIHRPIDA+e9/JBjfYCyfy4bTg==&mntnNm&mntnHght&mntnAdd&mntnInfoAraCd&mntnInfoThmCd');
    final response = await http.get(url);

    if(response.statusCode == 200) {
      final xml = response.body;
      final xml2json = Xml2Json()..parse(xml);
      final json = xml2json.toParker();
      final jsonResult = convert.jsonDecode(json);
      final jsonForestInformation = jsonResult['data'];

      jsonForestInformation.forEach((e) {
        final information= ForestInformationJsonModel.fromJson(e);
        forestJsonInformation.add(information);
      });
      return forestJsonInformation.toList();
    } else {
      print(response.statusCode);
      return [];
    }
  }

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

  //Column(
  //           children: [
  //             Expanded(
  //               child: ListView.builder(itemBuilder: (context, index){
  //                 var information = controller.forestInformation.value;
  //
  //                 return ForestListSquare();
  //               }),
  //             )
  //           ],
  //         ),

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
    List item = [];
    return ListView.builder(
        padding:const EdgeInsets.all(8),
        itemCount: forestJsonInformation.length,
        itemBuilder: (context, index) {
          return getCard(forestJsonInformation[index]);
        }
    );
  }

  Widget getCard(item) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 500,
        height: 510,
        child: Obx(() {
          //var information = controller.forestInformation.value;

          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                      "https://a.cdn-hotels.com/gdcs/production1/d1156/f6d7ba6d-b1b2-4cc6-bc62-9cef6e70db29.jpg?impolicy=fcrop&w=800&h=533&q=medium",
                      width:450,
                      height:400,
                      fit: BoxFit.fill
                  ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:<Widget> [
                      Text('\n', style:TextStyle(fontSize:5)),
                      Text(item['mntnnm'] ?? '', style:TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 2.0), textAlign: TextAlign.left,),
                      Text(item['mntnsbttlinfo'] ?? '', style: TextStyle(fontSize: 14,)),
                      Text(item['mntninfopoflc'] ?? '', style: TextStyle(fontSize: 14,)),
                      Text(item['mntninfohght'] ?? '', style: TextStyle(fontSize: 14,)),
                    ]
                )
              ]
          );
        }),
      ),
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



