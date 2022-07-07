import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
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
    final user = authentification.currentUser;
    try {
      if (user != null) {
        loggedUser = user;
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
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .where('email', isEqualTo: userEmail)
            .snapshots(),
        builder: (
          context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
        ) {

          final forestList = snapshot.data!.docs;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: forestList.length,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white), // 테두리
                          borderRadius: BorderRadius.circular(5), //모서리 둥글게
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child : Image.network(
                          forestList[index]["Image"],
                          width: double.infinity,
                          height: 400,
                          fit: BoxFit.fill,
                        ),
                        ),
                        SizedBox(height : 14),
                        Text(
                          forestList[index]["title"],
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0),
                        ),
                        SizedBox(height : 8),
                        Text(forestList[index]["subtitle"],
                            style: TextStyle(fontSize: 14,)),
                        Text(forestList[index]["description"],
                            style: TextStyle(fontSize: 14,)),
                        Text(forestList[index]["height"],
                            style: TextStyle(fontSize: 14,)),
                      ],
                    ));
                  },
                ),
              ),
            ],
          );
        });
  }
}
/*
  Widget _buildbody(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream:
      FirebaseFirestore.
      instance.
      collection('Users').
      where('(유저이메일', isEqualTo : '유저이메일').
      snapshots(),
      builder:(context, snapshot){
        if(!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data!.docs);

      }
    );
  }
  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot){
    return Expanded(
      child : GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1 / 1.5,
        padding : EdgeInsets.all(3),
        children : snapshot.map((data) => _buildListItem(context, data))
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data){
    final forest = Users.fromSnapshot(data);
    reuturn Inkwell
  }

   */
