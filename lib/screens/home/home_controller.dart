import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:trustfall/main.dart';
import 'package:trustfall/models/app_env.dart';
import 'package:trustfall/models/user_details_model.dart';
import 'package:trustfall/screens/home/home_view.dart';
import 'package:http/http.dart' as http;

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
    String url = AppEnv().api_url + "user_details.php?mobile=9287548490&password=yyktyk";
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
      if(returnedData["code"]=="user-found"){
        setState(() {
          userDetails = UserDetailsModel(
              user_id: returnedData['user_details']['user_id'],
              mobile: returnedData['user_details']['mobile'],
              username: returnedData['user_details']['username'],
              password: returnedData['user_details']['password'],
              emergency_contact: returnedData['user_details']['emergency_contact'],
              current_status: returnedData['user_details']['current_status']
          );
        });
      }
    }
  }
}