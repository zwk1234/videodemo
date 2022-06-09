import 'package:flutter/material.dart';
import 'package:videoapp/widget/login_input.dart';
import 'package:videoapp/widget/appbar.dart';
import 'package:videoapp/widget/login_effect.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    bool protect = false;
    return Scaffold(
        appBar: appBar("注册", "登录", () {
          print("right button click.");
        }),
        body: Container(
            child: ListView(
          children: [
            LoginEffect(protect: protect),
            LoginInput(
              "用户名",
              "请输入用户名",
              onChanged: (text) {
                print(text);
              },
            ),
            LoginInput(
              "密码",
              "请输入密码",
              lineStretch: true,
              obscureText: true,
              onChanged: (text) {
                print(text);
              },
              focusChanged: (focus) {
                setState(() {
                  print("!!!!!!$protect");
                  protect = focus;
                });
              },
            )
          ],
        )));
  }
}
