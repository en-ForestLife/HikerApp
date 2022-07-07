import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';
import 'package:hiker/src/model/ForestInformationModel.dart';
import '../api/forestInformationApi.dart';
import '../controller/forestInformationController.dart';
import 'package:hiker/src/controller/forestInformationController.dart';
import '../controller/DictionarySearchController.dart';
import 'package:hiker/src/main/ForestListSquare.dart';
import '../model/ForestInformationModel.dart';

class ForestPage extends StatefulWidget{
  const ForestPage({Key? key}) : super(key: key);

  @override
  ForestPageState createState()=> ForestPageState();
}

class ForestPageState extends State<ForestPage> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(ForestInformationController()).obs;
        Get.put(DictionarySearchController());
      }),
      home: ListPage(),
    );
  }
}

class ListPage extends GetView<ForestInformationController> {
  //const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: forestSearchingHeader(),
        body: SizedBox(
          child: Obx(() {
            int length = controller.forestInformation.value.length;
            try {
              if (length == 0) {
                return Image.network('https://ifh.cc/g/kmlSb3.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress)
                    {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes !=
                              null ? loadingProgress
                              .cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes! : null,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.blue),
                        ),
                      );
                    }
                );
              }
              else {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: length,
                          itemBuilder: (context, index) {
                            return ForestListSquare(index);
                          }),
                    )
                  ],
                );
              }
            } catch(e) {

            }
            throw {

            };
          }),
        ),
      ),
    );
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
              hintText: '어디로 가볼까요? Where do you want to go?',
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
            onFieldSubmitted: Get.put(controller.forestSearchingDetail)
        )
    );
  }

}