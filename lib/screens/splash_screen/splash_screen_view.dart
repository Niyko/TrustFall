import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sa_stateless_animation/sa_stateless_animation.dart';
import 'package:trustfall/screens/splash_screen/splash_screen_controller.dart';
import 'package:supercharged/supercharged.dart';

class SplashScreenView {
  double startAnimDelay = 0.5;
  Scaffold get(SplashScreenState splashScreenState){
    return new Scaffold(
        body: new Container(
          color: Color(0xfff3f3f3),
          child: Stack(
            children: <Widget>[
              PlayAnimation<double>(
                  tween: (200.0).tweenTo(130.0),
                  duration: 0.6.seconds,
                  delay: startAnimDelay.seconds,
                  curve: Curves.easeOut,
                  builder: (context, child, value) {
                    return Positioned(
                      child: Container(
                        width: MediaQuery.of(splashScreenState.context).size.width,
                        child: Center(
                          child: Image(
                            image: ExactAssetImage("assets/images/logo.png"),
                            fit: BoxFit.contain,
                            width: 210,
                          ),
                        ),
                      ),
                      top: value,
                      left: 0,
                    );
                  }),
              PlayAnimation<double>(
                  tween: (-100.0).tweenTo(0),
                  duration: 0.5.seconds,
                  delay: startAnimDelay.seconds,
                  curve: Curves.easeOut,
                  builder: (context, child, value) {
                    return Positioned(
                      child: Image(
                        image: ExactAssetImage("assets/images/splash_background.png"),
                        fit: BoxFit.contain,
                        width: MediaQuery.of(splashScreenState.context).size.width,
                      ),
                      bottom: value,
                      left: 0,
                    );
                  }),
              PlayAnimation<double>(
                  tween: (200.0).tweenTo(50.0),
                  duration: 1.seconds,
                  delay: startAnimDelay.seconds,
                  curve: Curves.easeOut,
                  builder: (context, child, value) {
                    return Positioned(
                        child: Lottie.asset('assets/anim/cycle.json',
                          width: MediaQuery.of(splashScreenState.context).size.width,
                        ),
                        bottom: 30,
                        left: value
                    );
                  }),
              PlayAnimation<double>(
                tween: (-30.0).tweenTo(15.0),
                duration: 0.3.seconds,
                delay: startAnimDelay.seconds,
                curve: Curves.easeOut,
                builder: (context, child, value) {
                  return Positioned(
                    child: Container(
                      width: MediaQuery.of(splashScreenState.context).size.width,
                      child: Center(
                        child: Opacity(
                          opacity: 0.3,
                          child: Image(
                            image: ExactAssetImage("assets/images/splash_footer.png"),
                            fit: BoxFit.contain,
                            width: 100,
                          ),
                        ),
                      ),
                    ),
                    bottom: value,
                    left: 0,
                  );
                }),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(splashScreenState.context).size.width,
                  height: MediaQuery.of(splashScreenState.context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff000000)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );;
  }
}