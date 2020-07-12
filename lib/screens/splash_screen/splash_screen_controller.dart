import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trustfall/main.dart';
import 'package:trustfall/screens/splash_screen/splash_screen_view.dart';

class SplashScreenController extends StatefulWidget {
  final StartAppState startapp;

  SplashScreenController({
    Key key,
    this.startapp
  }) : super(key: key);


  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreenController> {
  @override
  void initState() {
    super.initState();
    _continueApp();
  }

  @override
  Widget build(BuildContext context) {
    return new SplashScreenView().get(this);
  }

  void goto(){
    setState(() {
      widget.startapp.changeRoute('/signup', context);
    });
  }

  void _continueApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isUserSigned =  prefs.getBool('is-user-signed-in');

    Timer(
        Duration(seconds: 5),
            () => setState(() {
              if(isUserSigned)
                widget.startapp.changeRoute('/home', context);
              else
                widget.startapp.changeRoute('/signup', context);
            }));
  }
}