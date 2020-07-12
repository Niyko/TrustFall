import 'package:flutter/material.dart';
import 'package:trustfall/screens/login/login_controller.dart';

class LoginView {
  Scaffold get(LoginState loginState){
    return new Scaffold(
        body: new Center(
            child: new RaisedButton(
                child: const Text('Go to Settings'),
                onPressed: () => {
                  //splashScreenState.goto()
                }
            )
        )
    );;
  }
}