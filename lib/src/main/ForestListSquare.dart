import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hiker/src/main/ForestDetailSquare.dart';
import 'package:intl/intl.dart';
import '../controller/forestInformationController.dart';
import '../controller/translateLanguage.dart';
import 'package:get/get.dart';

class ForestListSquare extends GetView<ForestInformationController>{
  int index;
  int i=0;
  String languageString = '';
  static bool savedLanguage = true;
  ForestInformationController forestInformationController;
  translateLanguage change = Get.put(translateLanguage());
  var information;
  ForestListSquare(this.information, this.forestInformationController, this.index, {Key? key}) : super(key: key);

  @override
  GlobalKey<ForestListState> key = GlobalKey<ForestListState>();
  // NEW

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: SizedBox(
        width: 450,
        height: 510,
        child: Obx(() {
          //translateLanguage change = Get.put(translateLanguage());
          //var information = forestInformationController.forestInformation.value;
          String imageUrl = getUrl(information);
          return  Container(

            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) {
                        return ForestDetailSquare(information);
                      }),
                );
              },

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
                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress){
                                if(loadingProgress == null){
                                  return child;
                                }
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                  ),
                                );
                              },
                            ),
                          ),
                          Text('\n', style: TextStyle(fontSize: 5)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              GetBuilder<translateLanguage>(
                                builder:(_) => Text(getTitle('${change.result_papago[index]}')),
                              ),
                              //savedLanguage ? Text('${change.result_papago[index] }') : Text(information[index].mntnnm ?? '')),
                              Text(information[index].mntnnm ?? '', style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0),),

                              ForestList(key: key, image : imageUrl, title : information[index].mntnnm??'',
                                  subtitle : addSubtitle(information), description : information[index].mntninfopoflc ?? '',
                                  height : getHeightFormat(information))
                            ],
                          ),
                          Row(
                            children:[
                              GetBuilder<translateLanguage>(
                                builder:(_) => Text(getSubtitle('${change.result_papago[index]}')),
                              ),
                              Text(addSubtitle(information),
                                  style: TextStyle(fontSize: 14,)),
                            ],
                          ),
                          Row(
                              children:[
                                GetBuilder<translateLanguage>(
                                  builder:(_) => Text(getAddress('${change.result_papago[index]}'), style:TextStyle(fontSize:7)),
                                ),
                                Text(information[index].mntninfopoflc ?? '',
                                    style: TextStyle(fontSize: 14,)),
                              ],
                          ),
                          Text(getHeightFormat(information),
                              style: TextStyle(fontSize: 14,)),
                        ]
                    )
                  ]
              ),
            ),
          );
        }),
      ),
    );
  }

  String getUrl(var information) { // api ui 이미지 불러와지는지 판단한 후 이미지 내보내는 함수
    String imageUrl = information[index].mntnattchimageseq.toString();

    if(imageUrl.contains("FILE_000000000423986") || imageUrl.contains("FILE_000000000424249")) { // 특수 예외
      return 'https://ifh.cc/g/FapjP1.png';
    }

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

      return '공기 맑은 산';
    }
    return subTitle;
  }


  String getTitle(String allString) {
    List<String> strings = allString.split('♡');

    if (strings[0].contains('For example')) {
      return 'Garyeongsan';
    }
    if (strings[0].contains('Gamabong Peak')) {
      return 'Gamabong';
    }
    if (strings[0].contains('Gariwangsan')) {
      return 'Gariwangsan';
    }

    return strings[0];
  }

  String getSubtitle(String allString) {
    int index = allString.indexOf('♡');
    String middleString = allString.substring(index + 1);
    int secondIndex = middleString.lastIndexOf('♡');
    String realMiddleString = middleString.substring(0, secondIndex + 1).trimLeft();

    if(realMiddleString.trim() == '♡') {
      return 'An Airy Mountain';
    }

    return realMiddleString.replaceAll('♡', '');
  }

  String getAddress(String allString) {
    int index = allString.lastIndexOf('♡');

    return allString.substring(index + 1).trimLeft().replaceAll(', ', ',\n');
  }
}

void Print(int index){
  print(index);
}

void Print(int index){
  print(index);
}


class ForestList extends StatefulWidget{
  const ForestList({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.height,

  }) : super(key: key);
  final image;
  final title;
  final subtitle;
  final description;
  final height;



  @override
  State<ForestList> createState() => ForestListState();
}

class ForestListState extends State<ForestList> {
  final authentification = FirebaseAuth.instance;

  FirebaseFirestore fireStore=FirebaseFirestore.instance;
  bool savedFavorite = true;
  User? loggedUser;
  String userEmail = '';
  String? image;
  String? title;
  String? subtitle;
  String? height;
  String? description;


  @override
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
    int count = 0;
    return IconButton(
        onPressed: () async {
          count = 0;
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
                //print(snapShot.docs[count].reference.id);
                fireStore.
                collection("Users").
                doc().set(
                    {
                      'email' : userEmail,
                      'Image': widget.image,
                      'title': widget.title,
                      'subtitle' : widget.subtitle,
                      'description' : widget.description,
                      'height' : widget.height,
                    }
                    ).then(
                        (value) => print("DocumentSnapshot successfully updated!"),
                    onError: (e) => print("Error updating document $e"));
                ++count;
              }
            });
          });
          if(count == 0) {
            showDialog(
              context: context,
              barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
              builder: (BuildContext context) {
                // return object of type Dialog
                return AlertDialog(
                  title : Text('Notification'),
                  content: Text('로그인 후 이용가능합니다.'),
                  actions: <Widget>[
                    FlatButton(
                          child: Text('yes'),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                );
              },
            );
          };
        }, icon: Icon(
        savedFavorite ? Icons.favorite_border_outlined : Icons.favorite,
        color : savedFavorite ? null : Colors.red
    )
      // 언어 바꿀 수 있는 버튼
    );
  }

}