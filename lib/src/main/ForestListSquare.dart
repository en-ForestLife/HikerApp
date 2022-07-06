import 'dart:html';
import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import '../controller/forestInformationController.dart';

class ForestListSquare extends GetView<ForestInformationController> {
  int index;
  ForestListSquare(this.index, {Key? key}) : super(key: key);



  @override
  GlobalKey<_ForestListState> key = GlobalKey<_ForestListState>();
  // NEW

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 450,
        height: 510,
        child: Obx(() {
          var information = controller.forestInformation.value.obs;
          print(information);
          print('산산');
          String imageUrl = getUrl(information);

          return  Container(

            child : Column(
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child:
                          Image.network(imageUrl,
                            width: double.infinity,
                            height: 400,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text('\n', style: TextStyle(fontSize: 5)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Text(information[index].mntnnm ?? '', style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0),),

                            ForestList(key: key), // 좋아요인데 음 무슨 오류지
                          ],
                        ),
                        Text(addSubtitle(information),
                            style: TextStyle(fontSize: 14,)),
                        Text(information[index].mntninfopoflc ?? '',
                            style: TextStyle(fontSize: 14,)),
                        Text(getHeightFormat(information),
                            style: TextStyle(fontSize: 14,)),
                      ]
                  )
                ]
            ),
          );
        }),
      ),
    );
  }

  String getUrl(var information) { // api ui 이미지 불러와지는지 판단한 후 이미지 내보내는 함수
    String imageUrl = information[index].mntnattchimageseq.toString();
    if (imageUrl.contains("FILE")) {
      return imageUrl;
    }
    return 'https://ifh.cc/g/FapjP1.png';
  }

  String getHeightFormat(var information) { // 산 높이 값 콤마 표시 및 단위 추가 함수
    var format = NumberFormat('###,###,###,###');

    return format.format(int.parse(information[index].mntninfohght.toString())) + 'm';
  }

  String addSubtitle(var information) { // 부제 없는 산은 부제 따로 추가
    String subTitle = information[index].mntnsbttlinfo.toString();
    if(subTitle.length == 1) { // 주의 - 부제가 안나오지만 길이는 1로 계산됨
      return '공기 맑은 산'; //
    }
    return subTitle;
  }
}

class ForestList extends StatefulWidget{
  const ForestList({Key? key}) : super(key: key);

  @override
  State<ForestList> createState() => _ForestListState();
}

class _ForestListState extends State<ForestList> {
  final authentification = FirebaseAuth.instance;
  FirebaseFirestore fireStore=FirebaseFirestore.instance;
  bool savedFavorite = true;
  User? loggedUser;
  String userEmail = '';

  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    final user = await authentification.currentUser;
    try {
      if (user != null) {
        loggedUser = user;
        userEmail = loggedUser!.email!;
      }
      else{
        print(user);
      }
    }catch(error){
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          setState((){
            if(savedFavorite){
              savedFavorite = false;
            }
            else {
              savedFavorite = true;
            }
          });
          await FirebaseFirestore.instance
              .collection('User')
              .get()
              .then((snapShot) {
            snapShot.docs.forEach((element) {
              if(element["email"] == userEmail){
                print(snapShot.docs);
              }
            });
          });
        }, icon: Icon(
        savedFavorite ? Icons.favorite_border_outlined : Icons.favorite,
        color : savedFavorite ? null : Colors.red
    )
      // 언어 바꿀 수 있는 버튼
    );
  }
}
