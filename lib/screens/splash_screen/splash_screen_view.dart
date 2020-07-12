import 'package:flutter/material.dart';
import 'package:trustfall/screens/splash_screen/splash_screen_controller.dart';

class SplashScreenView {
  Scaffold get(SplashScreenState splashScreenState){
    return new Scaffold(
        body: new Center(
            child: new RaisedButton(
                child: const Text('Go to Settings'),
                onPressed: () => {
                  splashScreenState.goto()
                }
            )
        )
    );;
  }
}