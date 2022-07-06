import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/PreparationItemModel.dart';

class PreparationScreen extends StatefulWidget {
  const PreparationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PreparationScreenState();
}

class _PreparationScreenState extends State<PreparationScreen> {
  Widget infoDialog(){
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.limeAccent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)),
      child: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlutterLogo( size: 150,),
            Text(
              "This is a Custom Dialog",
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  //Navigator.of(context).pop();
                },
                child: Text("Close"))
          ],
        ),
      ),
    );
  }

  Widget materialCardWidget(String imagePath, String name, String detailInfo){
    return Card(
      elevation: 50,
      shadowColor: Colors.black,
      color: Colors.white,
      child: InkWell(
        onTap: () {
          showDetail(name, detailInfo);
        },
        child: SizedBox(
          height: 120,
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 40,
              ), //SizedBox
              CircleAvatar(
                backgroundColor: Colors.orange,
                radius: 40,
                backgroundImage: AssetImage(imagePath),
              ), //CircleAvatar
              const SizedBox(
                width: 40,
              ), //SizedBox

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ), //Textstyle
                    ), //Text
                    //Text(
                    //  semiInfo,
                    //  style: TextStyle(
                    //    fontSize: 20,
                    //    color: Colors.black,
                    //    fontWeight: FontWeight.w500,
                    //  ), //Textstyle
                    //)
                  ]
              ),
            ],
          ), //Column
        ), //SizedBox
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TIP',
          style: TextStyle(
              color: Colors.black, // 글자 색상 검정색
              fontSize: 22.0, // 폰트 사이즈
              fontWeight: FontWeight.bold // 폰트 굵기
          ),
        ),
        leading: IconButton(
          // 리딩 부분 (뒤로가기)
          onPressed: () {
            // 버튼
            Navigator.pop(context); //뒤로가기
          },
          color: Colors.black, // 버튼 색상
          icon: Icon(Icons.arrow_back), // 뒤로가기 이미지 아이콘
        ),
        centerTitle: true,
        // 글자 중간으로 위치 지정
        elevation: 0.0,
        // 붕 떠 있는 효과를 줌
        backgroundColor: Colors.white, // 배경색상 흰색
      ),

      body: SingleChildScrollView(
        child : Stack(
          children: [
            Positioned(
              child: Container(
                padding: EdgeInsets.all(50.0),
                child: Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        materialCardWidget(PreparationItemModel().itemImagePath[0], PreparationItemModel().itemName[0], PreparationItemModel().itemDetailInfo[0]),

                        SizedBox(
                          height: 10,
                        ),

                        materialCardWidget(PreparationItemModel().itemImagePath[1], PreparationItemModel().itemName[1], PreparationItemModel().itemDetailInfo[1]),

                        SizedBox(
                          height: 10,
                        ),

                        materialCardWidget(PreparationItemModel().itemImagePath[2], PreparationItemModel().itemName[2], PreparationItemModel().itemDetailInfo[2]),

                        SizedBox(
                          height: 10,
                        ),

                        materialCardWidget(PreparationItemModel().itemImagePath[3], PreparationItemModel().itemName[3], PreparationItemModel().itemDetailInfo[3]),

                        SizedBox(
                          height: 10,
                        ),

                        materialCardWidget(PreparationItemModel().itemImagePath[4], PreparationItemModel().itemName[4], PreparationItemModel().itemDetailInfo[4]),

                        SizedBox(
                          height: 10,
                        ),

                        materialCardWidget(PreparationItemModel().itemImagePath[5], PreparationItemModel().itemName[5], PreparationItemModel().itemDetailInfo[5]),

                        SizedBox(
                          height: 10,
                        ),

                        materialCardWidget(PreparationItemModel().itemImagePath[6], PreparationItemModel().itemName[6], PreparationItemModel().itemDetailInfo[6]),

                        SizedBox(
                          height: 10,
                        ),

                        materialCardWidget(PreparationItemModel().itemImagePath[7], PreparationItemModel().itemName[7], PreparationItemModel().itemDetailInfo[7]),

                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void showDetail(String name, String detailInfo) {
    showDialog(
      context: context,
      barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(name),
          content: Text(detailInfo),
          actions: <Widget>[
            FlatButton(
              child: Text("닫기"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

}