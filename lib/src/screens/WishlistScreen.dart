import 'package:cloud_firestore/cloud_firestore.dart';
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
        print(user);
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
          '위시리스트',
          style: TextStyle(
              color: Colors.black, // 글자 색상 검정색
              fontSize: 22.0, // 폰트 사이즈
              fontWeight: FontWeight.bold // 폰트 굵기
              ),
        ),
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
                child : Container(
                  color : Colors.white,
                  child :Column(
                  children:[
                    SizedBox(
                      height : 1000,
                      child : StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('Users')
                              .where('email', isEqualTo: userEmail)
                              .snapshots(),
                          builder: (
                              context,
                              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
                              ) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final forestList = snapshot.data!.docs;
                            return Column(
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
                                            borderRadius: BorderRadius.circular(
                                                5), //모서리 둥글게
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius
                                                    .circular(15.0),
                                                child: Image.network(
                                                  forestList[index]["Image"],
                                                  width: double.infinity,
                                                  height: 400,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              SizedBox(height: 14),
                                              Text(
                                                forestList[index]["title"],
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 2.0),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                  forestList[index]["subtitle"],
                                                  style: TextStyle(
                                                    fontSize: 14,)),
                                              Text(
                                                  forestList[index]["description"],
                                                  style: TextStyle(
                                                    fontSize: 14,)),
                                              Text(forestList[index]["height"],
                                                  style: TextStyle(
                                                    fontSize: 14,)),
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
}
