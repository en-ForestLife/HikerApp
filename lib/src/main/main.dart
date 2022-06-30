import 'dart:js';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../utils/checkInformation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  bool valuefirst = false;
  bool valuesecond = false;

  String id = '';
  String password = '';
  String email = '';
  String name = '';
  String birth = '';
  String sex = '';

  var message = '';

  FocusNode _emailFocus = new FocusNode();
  FocusNode _passwordFocus = new FocusNode();
  TextEditingController passwordEditingController = TextEditingController();

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
                      idInput(), // 아이디
                      Email(), // 이메일 입력
                      passwordInput(), // 비밀번호
                      passwordCheck(), // 비밀번호 체크
                      nameInput(), // 이름 입력
                      birthInput(), // 생일 입력

                      Container(
                        color: Colors.white,
                        height: 50,
                        key : ValueKey(7),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                            ),
                            Expanded(
                              // 비율조정
                              flex: 10,
                              child: Text(
                                '성별',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              // 비율조정
                              flex: 1,
                              child: Text(
                                '남자',
                                style: TextStyle(fontSize: 17.0),
                              ),
                            ),
                            Checkbox(
                              checkColor: Colors.greenAccent,
                              activeColor: Colors.red,
                              value: this.valuefirst,
                              onChanged: (value) {
                                if (!this.valuesecond) // 남녀 하나만 선택
                                  setState(() {
                                    this.valuefirst = value!;
                                      sex = this.valuefirst.toString();
                                  });
                              },
                            ),
                            Text(
                              '여자',
                              style: TextStyle(fontSize: 17.0),
                            ),
                            Checkbox(
                              value: this.valuesecond,
                              onChanged: (value) {
                                if (!this.valuefirst) // 남녀 하나만 선택히
                                  setState(() {
                                    this.valuesecond = value!;
                                      sex = this.valuefirst.toString();
                                  });
                              },
                            ),
                          ],
                        ),
                      ),

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

                bool check = checkIdAndEmail();
                if(checkValidation() && !check){ // 회원정보 다 채우고 아이디 또는 비밀번호가 중복이 없을 때
                    showDialog(
                      context: context,
                      barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
                      builder: (BuildContext context) {
                        // return object of type Dialog
                        return AlertDialog(
                          title: Text("안내메시지"),
                          content: Text(message),
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
                  /*
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
*/
                  fireStore.collection('User').where("id", isEqualTo: email).get().then( // 이건 함 찾아봐야 할듯
                        (res) => print('SUCCESS'),
                    onError: (e) => print("Error completing: $e"),
                  );
                  _getSubCnt(); // 도큐먼트 수 알려줌
                }

                /*
                final newUser = _authentication.createUserWithEmailAndPassword(
                    email: email,
                    password: password
                );*/
/*
                fireStore.collection('User').doc().set({
                  "id" : id,
                  "email" : email,
                  "password" : password,
                  "name" : name,
                  "birth" : birth,
                  "sex" : sex,
                });
                */
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

  Widget idInput() {
    // 아이디 위젯
    return SizedBox(
      height: 80,
        child: TextFormField(
          key : ValueKey(1),
          keyboardType: TextInputType.text,
          decoration: _textFormDecoration('영문 + 숫자 조합 4~12자', '아이디'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (dynamic val) {
            id = val;
          },
          validator: (value) =>
              CheckValidate().validateId(value.toString()),
          onSaved : (value){
            id = value!;
          },
        ),
    );
  }

  Widget passwordInput() {
    // 비밀번호 위젯
    return SizedBox(
      height: 80,

        child: TextFormField(
          key : ValueKey(2),
          keyboardType: TextInputType.visiblePassword,
          controller: passwordEditingController,
          decoration:
              _textFormDecoration('영문 대.소문자 + 숫자 + 특수문자 조합 8~15자', '비밀번호'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (dynamic val) {
            password = val;
          },
          validator: (value) =>
              CheckValidate().validatePassword(value.toString()),
          onSaved : (value){
            password = value!;
          },
          obscureText:true,
        ),

    );
  }

  Widget passwordCheck() {
    // 비밀번호 확인 위젯
    return SizedBox(
      height: 80,

        child: TextFormField(
          key : ValueKey(3),
          keyboardType: TextInputType.emailAddress,
          decoration: _textFormDecoration('비밀번호를 다시 입력해주세요', '비밀번호 확인'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (dynamic val) {},
          validator: (value) {
            if (value == '') {
              return '비밀번호를 입력하세요';
            }
            else if (value.toString() != passwordEditingController.text.toString()) {
              return '비밀번호가 일치하지 않습니다.';
            } else {
              return null;
            }
          },
          obscureText:true,
        ),

    );
  }

  Widget Email() {
    // 이메일 위젯
    return SizedBox(
      height: 80,

        child: TextFormField(
          key : ValueKey(4),
          keyboardType: TextInputType.emailAddress,
          decoration: _textFormDecoration('이메일 형식에 맞게 입력', '이메일'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (dynamic val) {
            email = val;
          },
          validator: (value) =>
              CheckValidate().validateEmail(value.toString()),
          onSaved : (value){
            email = value!;
          },
        ),

    );
  }

  Widget nameInput() {
    // 이름 위젯
    return SizedBox(
      height: 80,
        child: TextFormField(
          key : ValueKey(5),
          keyboardType: TextInputType.text,
          decoration:
          _textFormDecoration('실명입력', '이름'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (dynamic val) {
            name = val;
          },
          validator: (value) =>
              CheckValidate().validateName(value.toString()),
          onSaved : (value){
            name = value!;
          },
        ),

    );
  }

  Widget birthInput() {
    // 생년월일 위젯
    return SizedBox(
      height: 80,

        child: TextFormField(
          key : ValueKey(6),
          keyboardType: TextInputType.text,
          decoration:
          _textFormDecoration('ex) 1999-08-20', '생년월일'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (dynamic val) {
            birth = val;
          },
          validator: (value) =>
              CheckValidate().validateBirth(value.toString()),
          onSaved : (value){
            birth = value!;
          },
        ),

    );
  }

  InputDecoration _textFormDecoration(hintText, labelText) {
    // 텍스트 필드 꾸미기
    return new InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.0,
          )
      ),

      focusedBorder: OutlineInputBorder(
        // 해당 포커스 밑줄 파란색에서 검은색으로 변경
        borderSide: BorderSide(
          color: Colors.teal,
        ),
      ),
      contentPadding: EdgeInsets.all(8),
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: 14,
        color: Colors.grey,
      ),
      labelText: labelText,
      labelStyle: TextStyle(
        color: Colors.black, // 포커스 갔을 때 텍스트 파란색에서 검정색으로 변경
      ),
      filled: true,
      fillColor: Colors.white,
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

  bool checkIdAndEmail(){
    bool check = false;
    fireStore // 아이디, 이메일 중복체크인데 for문으로 찾아서 where로 찾을 수 있나 찾아봐야함
        .collection('User')
        .snapshots()
        .listen((data){
      data.docs.forEach((element) {
        if(element['id'] == id){
          message = '이미 존재하는 아이디입니다.';
          check = true;
        }
        else if(element['email'] == email){
          message = '이미 존재하는 이메일입니다.';
          check = true;
        }
        else message = '회원가입이 완료되었습니다.';
      });
    });

    return check;
  }

}
