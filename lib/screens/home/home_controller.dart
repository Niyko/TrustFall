import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trustfall/main.dart';
import 'package:trustfall/models/app_env.dart';
import 'package:trustfall/models/user_details_model.dart';
import 'package:trustfall/screens/home/home_view.dart';
import 'package:http/http.dart' as http;
import 'package:trustfall/widgets/modal.dart';
import 'package:trustfall/widgets/popup.dart';

class HomeController extends StatefulWidget {
  final StartAppState startapp;

  HomeController({
    Key key,
    this.startapp
  }) : super(key: key);

  String userName;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeController> {
  UserDetailsModel userDetails;
  bool isSwipeLoading = false;
  bool isViewClosed = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  HomeView homeView = HomeView();

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return homeView.get(this, scaffoldKey);
  }


  @override
  void dispose() {
    isViewClosed = true;
  }

  onSwipeToRefresh() {
    setState(() {
      userDetails = null;
    });
    homeView.refreshController.refreshCompleted();
    Timer(
        Duration(seconds: 1),
            () => getUserDetails());
  }

  getUserDetails() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userMobile = prefs.getString('user-mob');
    String userPassword = prefs.getString('user-pass');
    String url = AppEnv().api_url + "user_details.php?mobile=${userMobile}&password=${userPassword}";

    Response response = await get(url).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return null;
      },
    );
    var responseCode;
    if(response==null) responseCode = 500;
    else responseCode = response.statusCode;

    if(responseCode==200){
      var returnedData = json.decode(response.body);
      if(returnedData["code"]=="user-found" && !isViewClosed){
        setState(() {
          userDetails = UserDetailsModel(
              user_id: returnedData['user_details']['user_id'],
              mobile: returnedData['user_details']['mobile'],
              username: returnedData['user_details']['username'],
              password: returnedData['user_details']['password'],
              emergency_contact: returnedData['user_details']['emergency_contact'],
              current_status: returnedData['user_details']['current_status'],
              falls_detected: returnedData['user_details']['falls_detected'],
              falls_answered: returnedData['user_details']['falls_answered']
          );
        });
      }
    }
    else {
      if(!isViewClosed) {
        InfoModal(
          title: "No internet connection",
          description: "Connection to the internet failed, Please turn on the internet connection",
          isPostiveBtnEnabled: true,
          postiveBtnText: "Retry",
          postiveBtnOnClick: () {
            Navigator.of(context).pop();
            getUserDetails();
          },
          context: context,
        ).show();
      }
    }
  }

  logout() async{
    InfoModal(
        title: "Signing out?",
        description: "Are you sure you want to sign out from this account",
        isCloseEnabled: true,
        isPostiveBtnEnabled: true,
        postiveBtnText: "Sign out",
        postiveBtnOnClick: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('is-user-signed-in', false);
          Navigator.of(context).pop();
          widget.startapp.changeRoute('/login', context);
        },
        context: context,
    ).show();
  }

  dora(){
    Navigator.of(context).pop();
    widget.startapp.changeRoute("/sending", context);
  }

  featureNotAvailable(){
    InfoModal(
      title: "Feature not available",
      description: "Connection to the internet failed, Please turn on the internet connection",
      isCloseEnabled: true,
      context: context,
    ).show();
  }
}