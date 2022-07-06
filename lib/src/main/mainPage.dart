import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';
import 'package:hiker/src/model/ForestInformationModel.dart';
import '../api/forestInformationApi.dart';
import '../controller/forestInformationController.dart';
import 'package:hiker/src/controller/forestInformationController.dart';
import 'package:hiker/src/main/ForestListSquare.dart';
import '../model/ForestInformationModel.dart';

class ForestPage extends StatefulWidget{
  @override
  MainPage createState()=> MainPage();
}

class MainPage extends State<ForestPage> {
  //const MainPage({Key? key}) : super(key: key);
  /*
  @override
  void initState() {
    print('init');
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(ForestInformationController()).obs;
      }),
      home:ListPage(),
    );
  }
}

class ListPage extends GetView<ForestInformationController> {
  const ListPage({Key? key}) : super(key: key);

  forestSearchingDetails(String mountainName) {
    if(mountainName.length == 0) {
      mountainName = '';
    }
    //ForestInformationApi forestInformationApi;
    RxList<ForestInformationModel> forestInformation = <ForestInformationModel>[].obs;
    ForestInformationApi forestInformationApi;
    forestInformationApi = ForestInformationApi(mountainName.obs);
    Get.put(ForestInformationController().onInit());
    print('forest');

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: forestSearchingHeader(),
        body: SizedBox(
          child: Obx(() {
            print(controller.forestInformation.value.length);
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: controller.forestInformation.value.length,
                      itemBuilder: (context, index) {
                        return ForestListSquare(index);
                      }),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}


/////// 상단 검색바 ////////
TextEditingController textEditingController = TextEditingController(); // 검색 컨트롤러

eraseTextField() { // 검색창에서 x 누르면 검색 취소
  textEditingController.clear();
}

String searchedName = '';
forestSearchingDetail(mountainName) {
  print(mountainName);
  searchedName = mountainName;
  //Get.put(ForestInformationController(searchedName));
  //Get.put(ForestInformationController(str));
}

AppBar forestSearchingHeader() { // 상단 검색창
  return AppBar(
      backgroundColor: Colors.white,
      title: TextFormField(
        cursorColor: Colors.red,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: '어디로 가볼까요?',
          hintStyle: TextStyle(
            color:Colors.grey,
            fontSize: 14,
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
        onFieldSubmitted: Get.put(ForestInformationController().forestSearchingDetail),
      )
  );
}




