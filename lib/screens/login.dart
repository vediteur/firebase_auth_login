import 'package:firebase_auth_login/data/join_or_login.dart';
import 'package:firebase_auth_login/helper/login_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; // 화면 사이즈

    return Scaffold(
        // 보여지는 앱 화면의 구조를 정의
        body: Stack(
      // 스택을 쌓기 위해 정의 Stack - children
      alignment: Alignment.center,
      children: <Widget>[
        CustomPaint(
          size: size,
          painter: LoginBackground(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _logoImage,
            Stack(
              children: <Widget>[
                _inputForm(size),
                _authButton(size),
              ],
            ),
            Container(
              height: size.height * 0.01,
            ),
            Text("Don`t have an Account? Create One"),
            Container(
              height: size.height * 0.05,
            )
          ],
        )
      ],
    ));
  }

  Widget get _logoImage => Expanded(
    child: Padding(
      padding: const EdgeInsets.only(top: 60, left: 80, right: 80),
      child: FittedBox(
        fit: BoxFit.contain,
        child: CircleAvatar(
          backgroundImage: NetworkImage("https://picsum.photos/200"),
        ),
      ),
    ),
  );

  Widget _authButton(Size size) {
    return Positioned(
      left: size.width * 0.15,
      right: size.width * 0.15,
      bottom: 0,
      child: SizedBox(
        height: 50,
        child: RaisedButton(
            child: Text("Login", style:  TextStyle(fontSize: 20, color: Colors.white),),
            color: Colors.deepPurple,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular((25))),
            onPressed: () {
              if (_formKey.currentState.validate()){
                print(_emailController.text.toString());
              }
            }),
      ),
    );
  }

  Widget _inputForm(Size size) {
    return Padding(
      //카드의 패딩 값
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)), // 폼을 감싸는 형태 - 카드
        elevation: 6, // 그림자 값
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 32),
          // 폼의 패딩 값 - EdgeInsets.all 은 위아래 똑같이 주기
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.account_circle), labelText: "Email"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please input correct Email.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key), labelText: "Password"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please input correct Password.";
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 8,
                  ),
                  Text("Forgot Password", style: TextStyle(fontSize: 11),),
                ],
              )),
        ),
      ),
    );
  }
}
