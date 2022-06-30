import 'dart:js';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../screens/joinPageScreen.dart';
import '../screens/loginPageScreen.dart';
import '../utils/checkInformation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/inputDecoration.dart';
import '../widgets/joinPageWidgets.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
    apiKey: 'AIzaSyCixnmrkfi9PHOKja6DKeIsj_K3yExnXlk',
    appId: '1:974972266799:android:f1f8fbac8571a5438959da',
    messagingSenderId: '974972266799',
    projectId: 'enforestlife-d26ef',
    storageBucket: 'enforestlife-d26ef.appspot.com',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Navi'),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text("home"),
              ),
              Center(
                child: Text("music"),
              ),
              Center(
                child: Text("apps"),
              ),
              Center(
                child: Text("settings"),
              ),
            ],
          ),
          extendBodyBehindAppBar: true, // add this line

          bottomNavigationBar: Container(
            color: Colors.white, //색상
            child: Container(
              height: 70,
              padding: EdgeInsets.only(bottom: 10, top: 5),

              child: const TabBar(
                //tab 하단 indicator size -> .label = label의 길이
                //tab 하단 indicator size -> .tab = tab의 길이
                indicatorSize: TabBarIndicatorSize.label,
                //tab 하단 indicator color
                indicatorColor: Colors.red,
                //tab 하단 indicator weight
                indicatorWeight: 2,
                //label color
                labelColor: Colors.red,
                //unselected label color
                unselectedLabelColor: Colors.black38,
                labelStyle: TextStyle(
                  fontSize: 13,
                ),
                
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.home_outlined,
                    ),
                    text: '홈',
                  ),
                  Tab(
                    icon: Icon(Icons.favorite),
                    text: '위시리스트',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.agriculture,
                    ),
                    text: 'TIP',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.account_circle,
                    ),
                    text: '마이페이지',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}