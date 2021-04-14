import 'package:firebase_auth_login/data/join_or_login.dart';
import 'package:firebase_auth_login/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(                 // 앱의 제일 큰 박스. 홈 화면을 정의하고 어디로 이동할지, 테마는 무엇인지 설정
      home: ChangeNotifierProvider<JoinOrLogin>.value(
          value:JoinOrLogin(),
          child: AuthPage()),
    );
  }

}