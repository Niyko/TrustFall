import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trustfall/main.dart';
import 'package:trustfall/screens/login/login_view.dart';

class LoginController extends StatefulWidget {
  final StartAppState startapp;

  LoginController({
    Key key,
    this.startapp
  }) : super(key: key);


  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginController> {
  @override
  Widget build(BuildContext context) {
    return new LoginView().get(this);
  }
}