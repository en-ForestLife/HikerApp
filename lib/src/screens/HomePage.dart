import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'joinPageScreen.dart';
import 'loginPageScreen.dart';
import 'memberSearch.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  List<Widget> Options = [
    searchAccount(),
    loginPage(),
    joinPage(),
    loginPage()
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1, // 초기값 1 (홈)
      length: 4, // 갯수 4개
      child: Scaffold(

        body: TabBarView( //
          children: Options, // 어떤 아이템을 넣어줄 지
        ),

        bottomNavigationBar: TabBar( //(1)
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home_outlined),
              text: 'Home',
            ),
            Tab(
              icon: Icon(Icons.favorite_outline),
              text: 'favorite',
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
          labelColor: Colors.red, // 선택된 tab의 색
        ),
      ),
    );
  }
}
