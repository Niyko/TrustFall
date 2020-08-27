import 'dart:async';
import 'dart:developer';
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
    bool isUserSigned = prefs.getBool('is-user-signed-in');
    bool isFallDetected = prefs.getBool('is-fall-detected');
    if(isUserSigned==null) isUserSigned = false;
    if(isFallDetected==null) isFallDetected = false;
    Timer(
        Duration(seconds: 5),
            () => setState(() {
              Navigator.pop(context);
              if(isUserSigned) {
                if(isFallDetected)
                  widget.startapp.changeRoute('/sending', context);
                else
                  widget.startapp.changeRoute('/home', context);
              }
              else
                widget.startapp.changeRoute('/signup', context);
            }));
  }
}