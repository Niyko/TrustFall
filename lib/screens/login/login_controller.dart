import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trustfall/main.dart';
import 'package:trustfall/models/app_env.dart';
import 'package:trustfall/screens/login/login_view.dart';
import 'package:trustfall/widgets/modal.dart';

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
  bool isLoginLoading = false;
  BuildContext buildContext;
  String mobile, password;

  @override
  Widget build(BuildContext context) {
    return new LoginView().get(this);
  }

  loginUser(BuildContext context) async {
    setState(() {
      isLoginLoading = true;
    });

    bool isOnError = true;
    String errorMsg = "";
    String errorDesc = "Please fill the form completely to continue";

    if(mobile=="" || mobile==null) {
      errorMsg = "Mobile is empty";
    }
    else if(password=="" || password==null) {
      errorMsg = "Password is empty";
    }
    else isOnError = false;

    if(!isOnError){
      String url = AppEnv().api_url + "user_details.php?mobile=${mobile}&password=${password}";
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
        var returnedData = json.decode(response.body);
        if (returnedData['code'] == "user-pass-incorrect" || returnedData['code'] == "user-non-exist") {
          InfoModal(
            title: "Incorrect login credentials",
            description: "Mobile number or password you give is incorrect, please try again",
            isCloseEnabled: true,
            context: context,
          ).show();
        }
        else if(returnedData['code'] == "user-found"){
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('is-user-signed-in', true);
          prefs.setInt('user-id', returnedData['user_details']['id']);
          Navigator.pop(context);
          widget.startapp.changeRoute("/home", context);
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
      isLoginLoading = false;
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

  void openSignup(){
    Navigator.pop(context);
    widget.startapp.changeRoute("/signup", context);
  }

}