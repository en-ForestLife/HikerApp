import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:scroll_navigation/scroll_navigation.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/PreparationItemModel.dart';

class PreparationScreen extends StatefulWidget {
  const PreparationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PreparationScreenState();
}

class _PreparationScreenState extends State<PreparationScreen> {
  bool languageButton = false;

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
        actions: [
          OutlinedButton.icon(
            // 언어 바꿀 수 있는 버튼
            onPressed: () {
              // 영어로 언어 변경
              // 이후 앱을 재시작하면 영어로 동작
              if (!languageButton) {
                // 영어
                EasyLocalization.of(context)!.setLocale(Locale('en'));
                languageButton = true;
              } else {
                // 한국어
                EasyLocalization.of(context)!.setLocale(Locale('ko'));
                languageButton = false;
              }
            },
            icon: Icon(Icons.language_outlined),
            label: Text(
              "Language",
            ),
          ),
        ],
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

      body:
      TitleScrollNavigation(
        identiferStyle: NavigationIdentiferStyle(
          color:Colors.green,
        ),
        barStyle: TitleNavigationBarStyle(
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),

          spaceBetween: 50,
        ),
        titles: [
          "공통",
          "여름",
          "겨울",
        ],
        pages: [
          ListView.builder(
            itemCount: 1,
            //controller: controller,
            padding: EdgeInsets.zero,
            itemBuilder: (_, __) {
              return Padding(
                padding: EdgeInsets.only(bottom: 10),
                child:
                SingleChildScrollView(
                  child : Stack(
                    children: [
                      Positioned(
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(50.0),
                          child: Container(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  materialCardWidget(PreparationItemModel().itemImagePath[0], 'HikingBoots'.tr(), 'HikingBootsInfo'.tr()),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  materialCardWidget(PreparationItemModel().itemImagePath[1], 'HikingSocks'.tr(), 'HikingSocksInfo'.tr()),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  materialCardWidget(PreparationItemModel().itemImagePath[2], 'Gloves'.tr(), 'GlovesInfo'.tr()),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  materialCardWidget(PreparationItemModel().itemImagePath[3], 'Water'.tr(), 'WaterInfo'.tr()),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  materialCardWidget(PreparationItemModel().itemImagePath[4], 'Snack'.tr(), 'SnackInfo'.tr()),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  materialCardWidget(PreparationItemModel().itemImagePath[5], 'Bandage'.tr(), 'BandageInfo'.tr()),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  materialCardWidget(PreparationItemModel().itemImagePath[6], 'WetTissue'.tr(), 'WetTissueInfo'.tr()),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  materialCardWidget(PreparationItemModel().itemImagePath[7], 'Pole'.tr(), 'PoleInfo'.tr()),

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
            },
          ),
          ListView.builder(
            itemCount: 1,
            //controller: controller,
            padding: EdgeInsets.zero,
            itemBuilder: (_, __) {
              return Padding(
                padding: EdgeInsets.only(bottom: 10),
                child:
                SingleChildScrollView(
                  child : Stack(
                    children: [
                      Positioned(
                        child: Container(
                          padding: EdgeInsets.all(50.0),
                          child: Container(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  materialCardWidget(PreparationItemModel().itemImagePath[8], 'Cap'.tr(), 'CapInfo'.tr()),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  materialCardWidget(PreparationItemModel().itemImagePath[9], 'Towel'.tr(), 'TowelInfo'.tr()),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  materialCardWidget(PreparationItemModel().itemImagePath[10], 'No-bugs'.tr(), 'No-bugsInfo'.tr()),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  materialCardWidget(PreparationItemModel().itemImagePath[11], 'Sunglasses'.tr(), 'SunglassesInfo'.tr()),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  materialCardWidget(PreparationItemModel().itemImagePath[12], 'Sleeve'.tr(), 'SleeveInfo'.tr()),

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
            },
          ),
          ListView.builder(
            itemCount: 1,
            //controller: controller,
            padding: EdgeInsets.zero,
            itemBuilder: (_, __) {
              return Padding(
                padding: EdgeInsets.only(bottom: 10),
                child:
                SingleChildScrollView(
                  child : Stack(
                    children: [
                      Positioned(
                        child: Container(
                          padding: EdgeInsets.all(50.0),
                          child: Container(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  materialCardWidget(PreparationItemModel().itemImagePath[13], 'Crampons'.tr(), 'CramponsInfo'.tr()),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  materialCardWidget(PreparationItemModel().itemImagePath[14], 'Earmuffs'.tr(), 'EarmuffsInfo'.tr()),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  materialCardWidget(PreparationItemModel().itemImagePath[15], 'Neckwarmer'.tr(), 'NeckwarmerInfo'.tr()),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  materialCardWidget(PreparationItemModel().itemImagePath[16], 'Hat'.tr(), 'HatInfo'.tr()),

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
            },
          ),
        ],
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