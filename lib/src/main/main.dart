import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../screens/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import '../controller/forestInformationController.dart';
import '../screens/test.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
    apiKey: 'AIzaSyCixnmrkfi9PHOKja6DKeIsj_K3yExnXlk',
    appId: '1:974972266799:android:f1f8fbac8571a5438959da',
    messagingSenderId: '974972266799',
    projectId: 'enforestlife-d26ef',
    storageBucket: 'enforestlife-d26ef.appspot.com',
    ),
  );
  runApp(EasyLocalization(
      supportedLocales: [
      Locale('en'),
      Locale('ko')
  ],
      path: 'assets/translations', // 언어지원 폴더 경로
      fallbackLocale: Locale('en'), // 한국어 또는 영어가 없을 시 디폴트 영어로 설정
  child : MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 로케일 delegate
      localizationsDelegates: context.localizationDelegates,
      // 지원하는 로케일
      supportedLocales: context.supportedLocales,
      // 설정된 로케일
      locale: context.locale,
      /*
      initialBinding: BindingsBuilder(() {
        Get.put(ForestInformationController());
      }),*/
      home:homePage(),

    );
  }
}

