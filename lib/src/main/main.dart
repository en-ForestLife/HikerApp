import 'dart:js';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../utils/checkInformation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    return MaterialApp(home: joinPage());
  }
}

class joinPage extends StatefulWidget {
  // 회원가입 페이지
  @override
  _joinPage createState() => _joinPage();
}

//joinPage({Key? key}) : super(key: key); // 원래 const jounPage였음
class _joinPage extends State<joinPage> {
  final _authentication = FirebaseAuth.instance;
  FirebaseFirestore fireStore=FirebaseFirestore.instance;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '회원정보 입력 및 동의',
          style: TextStyle(
              color: Colors.black, // 글자 색상 검정색
              fontSize: 22.0, // 폰트 사이즈
              fontWeight: FontWeight.bold // 폰트 굵기
              ),
        ),
        leading: IconButton(
          // 리딩 부분 (뒤로가기)
          onPressed: () {
            // 버튼
            Navigator.pop(context); //뒤로가기
          },
          color: Colors.black, // 버튼 색상
          icon: Icon(Icons.arrow_back), // 뒤로가기 이미지 아이콘
        ),

        centerTitle: true,
        // 글자 중간으로 위치 지정
        elevation: 0.0,
        // 붕 떠 있는 효과를 줌
        backgroundColor: Colors.white, // 배경색상 흰색
      ),
      body: SingleChildScrollView(
        child : Stack(
        children: [
          Positioned(
            child: Container(
              // 아이디 비밀번호 레이아웃 박스
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white), // 테두리
                borderRadius: BorderRadius.circular(5), //모서리 둥글게
              ),

              child: Form(
                key: formKey,
                child: Theme(
                  // 왜 스타일 적용 안되냐
                  data: ThemeData(
                      primaryColor: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(
                        fontSize: 15,
                      ))),

                  child: Column(
                    children: [
                      joinWidgets().idInput(), // 아이디
                      joinWidgets().Email(), // 이메일 입력
                      joinWidgets().passwordInput(), // 비밀번호
                      joinWidgets().passwordCheck(), // 비밀번호 체크
                      joinWidgets().nameInput(), // 이름 입력
                      joinWidgets().birthInput(), // 생일 입력
                    ],
                  ),
                ), //아이디 비밀번호 레이아웃
              ),
            ),
          ),
        ],
      ),
      ),

      bottomNavigationBar: BottomAppBar(
        // 밑에 하단바(회원가입 버튼)
        child: Container(
            height: 50,
            child: ElevatedButton(
              onPressed: () {

                checkIdAndEmail();
                if(checkValidation()){ // 회원정보 다 채움
                  if(checkIdAndEmail() == "idOverlap" || checkIdAndEmail() == "emailOverlap") { // 아이디, 비밀번호 중복 있을 때
                    showDialog(
                      context: context,
                      barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
                      builder: (BuildContext context) {
                        // return object of type Dialog
                        return AlertDialog(
                          title: Text("안내메시지"),
                          content: Text(joinWidgets().message),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("닫기"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                  else if(checkIdAndEmail() == "pass"){ // 아이디 비밀번호 중복 없을 때
                    final newUser = _authentication.createUserWithEmailAndPassword( // 회원가입 메서드
                        email: joinWidgets().email,
                        password: joinWidgets().password
                    );

                    fireStore.collection('User').doc().set({ // 데베에 정보 저장
                      "id" : joinWidgets().id,
                      "email" : joinWidgets().email,
                      "password" : joinWidgets().password,
                      "name" : joinWidgets().name,
                      "birth" : joinWidgets().birth,
                      //"sex" : joinWidgets().sex,
                    });
                    showDialog(
                      context: context,
                      barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
                      builder: (BuildContext context) {
                        // return object of type Dialog
                        return AlertDialog(
                          title: Text("안내메시지"),
                          content: Text('회원가입이 완료되었습니다.'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("닫기"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                  /*
                  fireStore.collection('User').where("id", isEqualTo: email).get().then( // 이건 함 찾아봐야 할듯
                        (res) => print('SUCCESS'),
                    onError: (e) => print("Error completing: $e"),
                  );
                  _getSubCnt(); // 도큐먼트 수 알려줌
                  */
                }
              },
              child: Text("회원가입"),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey, // 버튼색상
                onPrimary: Colors.black, // 글자색상
              ),
            )),
      ),
    );
  }

  void _getSubCnt() { // 컬렉션 안의 도큐먼트 갯수 가져오기
    FirebaseFirestore.instance
        .collection('User')
        .get()
        .then((snapShot) {
      var qTotal = snapShot.docs.length;
      print(qTotal);
    });
  }
  bool checkValidation(){
    final isValid = formKey.currentState!.validate();
    if(isValid){
      formKey.currentState!.save();
    }
    return isValid;
  }

  String checkIdAndEmail(){
    fireStore // 아이디, 이메일 중복체크인데 for문으로 찾아서 where로 찾을 수 있나 찾아봐야함
        .collection('User')
        .snapshots()
        .listen((data){
      data.docs.forEach((element) {
        if(element['id'] == joinWidgets().id){
          joinWidgets().check = 'idOverlap';
          joinWidgets().message = '이미 존재하는 아이디입니다.';
        }
        else if(element['email'] == joinWidgets().email){
          joinWidgets().check = 'emailOverlap';
          joinWidgets().message = '이미 존재하는 이메일입니다.';
        }
        else joinWidgets().check = "pass";
      });
    });
    return joinWidgets().check;
  }

}
