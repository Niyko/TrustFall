import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:trustfall/models/app_env.dart';
import 'package:trustfall/screens/signup/signup_view.dart';
import 'package:trustfall/widgets/popup.dart';
import 'package:trustfall/widgets/modal.dart';
import 'package:trustfall/main.dart';

class SignupPageController extends StatefulWidget {
  final StartAppState startapp;

  SignupPageController({
    Key key,
    this.startapp
  }) : super(key: key);

  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPageController> {
  bool isSignUpLoading = false;
  BuildContext buildContext;
  String username, mobile, password, emergency_contact;

  @override
  Widget build(BuildContext context) {
    return new SignupView().get(this);
  }

  changeThe(){
    setState(() {
      widget.startapp.changeRoute('/splash', context);
    });
  }

  createUserc(BuildContext context) async {
    setState(() {
      isSignUpLoading = true;
    });

//    InfoModal(
//        title: "Something went wrong",
//        description: "I think it should be noted that removing the target tap size is 'generally' not a good practice",
//        isCloseEnabled: true,
//        context: context,
//    ).show();

    bool isOnError = true;
    String errorMsg = "";
    String errorDesc = "Please fill the form completely to continue";

    if(username=="" || username==null) {
      errorMsg = "Username is empty";
    }
    else if(mobile=="" || mobile==null) {
      errorMsg = "Mobile is empty";
    }
    else if(password=="" || password==null) {
      errorMsg = "Password is empty";
    }
    else if(emergency_contact=="" || emergency_contact==null) {
      errorMsg = "Contact no is empty";
    }
    else isOnError = false;

    if(!isOnError){
      var map = new Map<String, dynamic>();
      map['username'] = username;
      map['mobile'] = mobile;
      map['password'] = password;
      map['emergency_contact'] = emergency_contact;

      String url = AppEnv().api_url + "create_user.php";
      Response response = await post(url, body: map).timeout(
          const Duration(seconds: 20),
          onTimeout: () {
            return null;
          },
      );
      var responseCode;
      if(response==null) responseCode = 500;
      else responseCode = response.statusCode;

      if(responseCode==200){
        var returnedData = json.decode(response.body);
        if (returnedData['code'] == "user-exist") {
          InfoModal(
            title: "User already exists",
            description: "Please try to signin or try signing up using another mobile number",
            isCloseEnabled: true,
            isPostiveBtnEnabled: true,
            postiveBtnText: "sign in",
            postiveBtnOnClick: (){
              //widget.startapp.changeRoute("/spal", context);
            },
            context: context,
          ).show();
        }
        else if(returnedData['code'] == "user-created"){
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('is-user-signed-in', true);
          prefs.setInt('user-id', returnedData['user_id']);
          widget.startapp.changeRoute("/login", context);
        }
        else showOtherErrorModal();
      }
      else showOtherErrorModal();
    }
    else{
          InfoModal(
              title: errorMsg,
              description: errorDesc,
              isCloseEnabled: true,
              context: context,
          ).show();
    }

    setState(() {
      isSignUpLoading = false;
    });
  }

  void showOtherErrorModal(){
    InfoModal(
      title: "Something went wrong",
      description: "Please check your internet\nconnection or try again",
      isCloseEnabled: true,
      context: context,
    ).show();
  }

}