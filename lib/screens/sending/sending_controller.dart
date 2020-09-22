import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trustfall/main.dart';
import 'package:trustfall/models/app_env.dart';
import 'package:trustfall/screens/sending/sending_view.dart';
import 'package:trustfall/theme.dart';
import 'package:trustfall/widgets/modal.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userMobile = prefs.getString('user-mob');
    String userPassword = prefs.getString('user-pass');
    String url = AppEnv().api_url + "send_beacon.php?mobile=${userMobile}&password=${userPassword}";

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
      progressAnimationController.addStatusListener((status) {
        if(status==AnimationStatus.completed){
          SystemNavigator.pop();
          Fluttertoast.showToast(
              msg: "Distress beacon has been sent",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: ThemeColors().grey,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      });
    }
  }

}