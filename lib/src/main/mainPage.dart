import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';
import '../controller/forestInformationController.dart';
import 'package:hiker/src/controller/forestInformationController.dart';
import '../controller/DictionarySearchController.dart';
import 'package:hiker/src/main/ForestListSquare.dart';
import '../controller/translateLanguage.dart';
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
  translateLanguage change = Get.put(translateLanguage());
  static bool savedLanguage = true;
  GlobalKey<FormState> languageKey = GlobalKey<FormState>();

  String getImageUrl(String name) {
    if (name == '') {
      return 'assets/로딩중.png';
    }
    else {
    return 'assets/로딩중.png';
    }
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset : false, // 키보드로 인한 화면 안밀리게 하기? 크롬웹으로 테스트 불가한 부분
        backgroundColor: Colors.white,
        appBar: forestSearchingHeader(),
        body: SizedBox(
          child: Obx(() {
            var information = controller.forestInformation.value;
            int length = controller.forestInformation.value.length;
            try {
              if (length == 0) {
                return Image.network(getImageUrl(controller.mountainName),
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

                    changeButton(key: languageKey, information: information,),

                    Expanded(
                      child: ListView.builder(
                          itemCount: length,
                          itemBuilder: (context, index) {
                            return ForestListSquare(information.obs, controller, index);
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
        elevation: 0.0,
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
            onFieldSubmitted: controller.forestSearchingDetail
        )
    );
  }
}


class changeButton extends StatefulWidget {
  const changeButton({
    Key? key,
    required this.information,
  }) : super(key: key);
  final information;

  @override
  State<changeButton> createState() => _changeButtonState();
}

class _changeButtonState extends State<changeButton> {
  translateLanguage change = Get.put(translateLanguage());
  var information;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width : double.infinity,
      child : ElevatedButton(
      onPressed: (){
        for (int i=0;i<widget.information.length;i++) {
          Get.put(change.getTranslation_papago(widget.information[i], i));
        }
        setState((){
          if(ForestListSquare.savedLanguage) {
            ForestListSquare.savedLanguage = false;
          } else {
            ForestListSquare.savedLanguage = true;
          }
        });
      },
      //ForestList(key: key, image : imageUrl, title : information[index].mntnnm??'',

      child: Text('Language'),
        style: ElevatedButton.styleFrom(
          // background 속성이 없다.
            primary: Colors.black,
            shape: RoundedRectangleBorder(
              // 테두리를 라운드하게 만들기
            borderRadius: BorderRadius.circular(5.0)),
            elevation: 0.0),
    ),
    );
  }
}
