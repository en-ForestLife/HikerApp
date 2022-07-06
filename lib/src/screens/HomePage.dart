import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main/mainPage.dart';
import 'LoginBeforeScreen.dart';
import 'MyPage.dart';
import 'joinPageScreen.dart';
import 'loginPageScreen.dart';
import 'memberSearch.dart';
import 'TipScreen.dart';
import 'ForestInformationScreen.dart';
import 'PreparationScreen.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final authentification = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser(){
    final user = authentification.currentUser;
    try {
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    }catch(error){
      print(error);
    }
  }

  List<Widget> Options = [
    ForestPage(),
    joinPage(),
    TipScreen(),
    myPage(),

  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1, // 초기값 1 (홈)
      length: 4, // 갯수 4개
      child: Scaffold(

        body: TabBarView( //
          children: Options, // 위에 Option에 넣으면 넣은 페이지로 이동 가능
        ),

        bottomNavigationBar:
        SizedBox(
          height : 70, // 네비게이션 바 높이조절
        child: TabBar( //(1)
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home_outlined),
              text: 'Home',
            ),
            Tab(
              icon: Icon(Icons.favorite_outline),
              text: 'Wishlist',
            ),
            Tab(
              icon: Icon(Icons.tips_and_updates_outlined),
              text: 'TIP',
            ),
            Tab(
              icon: Icon(Icons.account_circle_outlined),
              text: 'MyPage',
            ),
          ],

          padding: EdgeInsets.only(bottom: 1, top: 2),
          indicatorColor: Colors.transparent, // indicator 없애기(밑에 파란 밑줄)
          unselectedLabelColor: Colors.black, // 선택되지 않은 tab 색
          labelColor: Colors.greenAccent, // 선택된 tab의 색
        ),
        ),
      ),
    );
  }
}
