import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LoginBeforeScreen.dart';
import 'WishList.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final authentification = FirebaseAuth.instance;
  User? loggedUser;
  String userEmail = '';
  String wishlistName = '';
  bool languageButton = false;
  bool IsNoneUser = false;


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
        print(loggedUser!.email);
        userEmail = loggedUser!.email!;
      } else {
        print(IsNoneUser);
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'wishList'.tr(),
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
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return loginBeforeScreen();
            } else {
              return SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1000,
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('Users')
                                .where('email', isEqualTo: userEmail)
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot<
                                    Map<String, dynamic>>> snapshot,) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              final forestList = snapshot.data!.docs;
                              return Row(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: forestList.length,
                                      itemBuilder: (context,
                                          index,) {
                                        return Container(
                                            padding: EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white), // 테두리
                                              borderRadius: BorderRadius
                                                  .circular(5), //모서리 둥글게
                                            ),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius
                                                      .circular(15.0),
                                                  child: Image.network(
                                                    forestList[index]["Image"],
                                                    width: 100,
                                                    height: 100,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          forestList[index]["title"],
                                                          softWrap: true,
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.bold,
                                                              letterSpacing: 2.0),
                                                        ),
                                                        IconButton(icon: Icon(
                                                          Icons.favorite,
                                                          color: Colors.red,
                                                          size: 22,
                                                        ),
                                                          onPressed: () {
                                                            setState(() {
                                                              removeWishlistButton();
                                                              wishlistName = forestList[index]["title"];
                                                            });
                                                          },
                                                        )

                                                      ],),
                                                    SizedBox(height: 1),

                                                    Text(
                                                        forestList[index]["subtitle"],
                                                        softWrap: true,
                                                        style: TextStyle(
                                                          fontSize: 14,)),
                                                    Text(
                                                        forestList[index]["description"],
                                                        softWrap: true,
                                                        style: TextStyle(
                                                          fontSize: 14,)),
                                                    Text(
                                                        forestList[index]["height"],
                                                        softWrap: true,
                                                        style: TextStyle(
                                                          fontSize: 14,)),
                                                  ],),
                                              ],
                                            ));
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          }
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }

  void removeWishlistButton() {
    showDialog(
      context: context,
      barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Text('removeWishlist'.tr()),
          actions: <Widget>[
            FlatButton(
                child: Text('yes'.tr()),
                onPressed: () {
                  removeWishlist();
                  Navigator.pop(context);
                }),
            FlatButton(
                child: Text('no'.tr()),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        );
      },
    );
  }

  void removeWishlist() async {
    int count = 0;
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .get()
          .then((snapShot) {
        snapShot.docs.forEach((element) {
          if (element["title"] == wishlistName) {
            if( element["email"] == userEmail) {
              fireStore.collection('Users')
                  .doc(snapShot.docs[count].reference.id)
                  .delete(); // 파이어스토어 계정삭제
            }
          }
          count++;
        });
      });
    } catch (e) {
      print(e);
    }
  }
}
    /*
    StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .where('title', isEqualTo: wishlistName)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
            //fireStore.collection('User').doc(snapShot.docs[count].reference.id).delete(); // 파이어스토어 계정삭제
          }
          else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final wishlist = snapshot.data!.docs;
        }
    );
  }
    */


