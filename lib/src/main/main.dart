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
    return MaterialApp(home: loginPage());
  }
}