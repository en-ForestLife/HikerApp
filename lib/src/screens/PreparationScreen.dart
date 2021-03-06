import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
              color: Colors.black, // ?????? ?????? ?????????
              fontSize: 22.0, // ?????? ?????????
              fontWeight: FontWeight.bold // ?????? ??????
          ),
        ),
        actions: [
          OutlinedButton.icon(
            // ?????? ?????? ??? ?????? ??????
            onPressed: () {
              // ????????? ?????? ??????
              // ?????? ?????? ??????????????? ????????? ??????
              if (!languageButton) {
                // ??????
                EasyLocalization.of(context)!.setLocale(Locale('en'));
                languageButton = true;
              } else {
                // ?????????
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
          // ?????? ?????? (????????????)
          onPressed: () {
            // ??????
            Navigator.pop(context); //????????????
          },
          color: Colors.black, // ?????? ??????
          icon: Icon(Icons.arrow_back), // ???????????? ????????? ?????????
        ),
        centerTitle: true,
        // ?????? ???????????? ?????? ??????
        elevation: 0.0,
        // ??? ??? ?????? ????????? ???
        backgroundColor: Colors.white, // ???????????? ??????
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
  }


  void showDetail(String name, String detailInfo) {
    showDialog(
      context: context,
      barrierDismissible: true, // ?????? ?????? ????????? ????????? ??????
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(name),
          content: Text(detailInfo),
          actions: <Widget>[
            FlatButton(
              child: Text("??????"),
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