import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'joinPageScreen.dart';
import 'loginPageScreen.dart';

class loginBeforeScreen extends StatefulWidget {
  const loginBeforeScreen({Key? key}) : super(key: key);

  @override
  State<loginBeforeScreen> createState() => _loginBeforeScreenState();
}

class _loginBeforeScreenState extends State<loginBeforeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              child : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Container(
                    width: double.infinity,
                    child: Text('profile'.tr(),
                      style: TextStyle(
                        //decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    child : Text('goLogin'.tr(),
                        style: TextStyle(
                          fontSize: 15,
                        ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
            Container(
              //width: MediaQuery.of(context).size.width - 70,
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black), // 테두리
                borderRadius: BorderRadius.circular(10), //모서리 둥글게
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => loginPage()),
                  );
                },
                child: Text('login'.tr()),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // 버튼색상
                  onPrimary: Colors.white, // 글자색상
                ),
              ),
            ),
            Container(
                child: Row(
              children: [
                SizedBox(height: 50),
                Text('isHikerAccount'.tr()),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => joinPage()),
                    );
                  },
                  child: Text(
                    'joinButton'.tr(),
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold), // 글씨 밑줄
                  ),
                ),
              ],
            ),
            ),
            Container(
              width: double.infinity,
                child: Divider(
                    color: Colors.grey,
                    thickness: 1.0),
            ),
            Container(
              height : 70,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  //contentPadding: EdgeInsets.all(25.0),
                  leading: Icon(
                    Icons.lightbulb_outline,
                    color: Colors.grey[850],
                  ),
                  title: Text(
                    'whatIsHiker'.tr(),
                    style: TextStyle(
                      color: Colors.black, // 글자 색상 검정색// 폰트 사이즈
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
                      builder: (BuildContext context) {
                        // return object of type Dialog
                        return AlertDialog(
                          title: Text('Notification'.tr()),
                          content: Text('하이커란 블라블라블라~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.tr()),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('close'.tr()),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
