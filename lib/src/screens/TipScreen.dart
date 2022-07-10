import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'PreparationScreen.dart';
import 'HikingTipScreen.dart';

class TipScreen extends StatelessWidget{

  bool languageButton = false;

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
                  padding: EdgeInsets.all(60.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white), // 테두리
                    borderRadius: BorderRadius.circular(5), //모서리 둥글게
                  ),
                  child: Container(
                      width: double.infinity,
                  child: Column(
                    children: [
                      Card(
                        elevation: 50,
                        shadowColor: Colors.black,
                        color: Colors.greenAccent[100],
                        child: InkWell(
                          onTap: () async => { await launchUrl(
                              Uri.parse("https://www.millim.in/en/goods/view/WQZEK-6892")//  url 이동
                          )
                          },
                          child: SizedBox(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.green[500],
                                  radius: 70,
                                  backgroundImage: AssetImage('assets/mountain_icon.png'),
                                ), //CircleAvatar
                                const SizedBox(
                                  width: 40,
                                ), //SizedBox
                                Text(
                                  'ClimbingEquipmentRentalInformation'.tr(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green[900],
                                    fontWeight: FontWeight.bold,
                                  ), //Textstyle
                                ), //Text
                                const SizedBox(
                                  height: 10,
                                ), //SizedBox
                              ],
                            ), //Column
                          ), //SizedBox
                        ),
                      ), //Card

                      SizedBox(
                        height: 30,
                      ),

                      Card(
                        elevation: 50,
                        shadowColor: Colors.black,
                        color: Colors.greenAccent[100],
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) {
                                    return HikingTipScreen();
                                  }),
                            );
                          },
                          child: SizedBox(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.green[500],
                                  radius: 70,
                                  backgroundImage: AssetImage('assets/hiker_icon.png'),
                                ), //CircleAvatar
                                const SizedBox(
                                  width: 40,
                                ), //SizedBox
                                Text(
                                  'hikerTip'.tr(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green[900],
                                    fontWeight: FontWeight.bold,
                                  ), //Textstyle
                                ), //Text
                                const SizedBox(
                                  height: 10,
                                ), //SizedBox
                              ],
                            ), //Column
                          ), //SizedBox
                        ), //Card
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      Card(
                        elevation: 50,
                        shadowColor: Colors.black,
                        color: Colors.greenAccent[100],
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) {
                                    return PreparationScreen();
                                  }),
                            );
                          },
                          child: SizedBox(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.green[500],
                                  radius: 70,
                                  backgroundImage: AssetImage('assets/bag_icon.png'),
                                ), //CircleAvatar
                                const SizedBox(
                                  width: 40,
                                ), //SizedBox
                                Text(
                                  'hikerItem'.tr(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green[900],
                                    fontWeight: FontWeight.bold,
                                  ), //Textstyle
                                ), //Text
                                const SizedBox(
                                  height: 10,
                                ), //SizedBox
                              ],
                            ), //Column
                          ), //SizedBox
                        ), //Card
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

}