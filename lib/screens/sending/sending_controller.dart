import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trustfall/main.dart';
import 'package:trustfall/models/app_env.dart';
import 'package:trustfall/screens/sending/sending_view.dart';
import 'package:trustfall/widgets/modal.dart';

class SendingController extends StatefulWidget {
  final StartAppState startapp;

  SendingController({
    Key key,
    this.startapp
  }) : super(key: key);

  @override
  SendingState createState() => SendingState();
}

class SendingState extends State<SendingController> with SingleTickerProviderStateMixin {
  BuildContext buildContext;
  int sendingProgress = 0;
  AnimationController progressAnimationController;
  Animation<double> progressAnimation;

  @override
  void initState() {
    progressAnimationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this
    );

    progressAnimation = Tween<double>(
      begin: 0,
      end: 100,
    ).animate(progressAnimationController)
    ..addListener(() {
      setState(() {

      });
    });

    sendBeacon(context);
  }

  @override
  Widget build(BuildContext context) {
    return new SendingView().get(this);
  }

  sendBeacon(BuildContext context) async {
    String mobile = "9287548490";
    String password = "yyktyk";
    String url = AppEnv().api_url + "send_beacon.php?mobile=${mobile}&password=${password}";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('is-fall-detected', false);

    Response response = await get(url).timeout(
      const Duration(seconds: 20),
      onTimeout: () {
        return null;
      },
    );

    var responseCode;
    if(response==null) responseCode = 500;
    else responseCode = response.statusCode;

    if(responseCode==200){
      progressAnimationController.forward();
    }
  }

}