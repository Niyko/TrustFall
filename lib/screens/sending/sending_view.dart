import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:trustfall/screens/sending/sending_controller.dart';
import 'package:trustfall/screens/sending/widgets/progress_sending.dart';
import '../../theme.dart';

class SendingView {

  Scaffold get(SendingState sendingState){
    return new Scaffold(
        backgroundColor: ThemeColors().light_yellow,
        body: Builder(
          builder: (context) => Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Lottie.asset('assets/anim/waves.json',
                    height: MediaQuery.of(sendingState.context).size.height,
                    fit: BoxFit.cover,
                  ),
                  top: 0,
                  left: -58
                ),
                Positioned(
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(sendingState.context).size.width,
                    height: MediaQuery.of(sendingState.context).size.height,
                    child: Center(
                      child: GestureDetector(
                        child: Image(
                          image: ExactAssetImage("assets/images/location_pin_badge.png"),
                          fit: BoxFit.contain,
                          width: 250,
                        ),
                      ),
                    ),
                  ),
                  top: 0,
                  left: 0
                ),
                Positioned(
                    child: Container(
                      width: MediaQuery.of(sendingState.context).size.width,
                      child: Column(
                        children: <Widget>[
                          Text("Transmitting".toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 23
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Opacity(
                            opacity: 0.5,
                            child: Text("Fall detected, sending\nhelp message to others",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          ProgressSending(
                            progress: sendingState.progressAnimation.value,
                          ),
                        ],
                      ),
                    ),
                    bottom: 120,
                    left: 0
                )
              ],
            ),
          ),
        )
    );
  }
}