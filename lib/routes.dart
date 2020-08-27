import 'package:flutter/material.dart';
import 'package:trustfall/screens/about/about_controller.dart';
import 'package:trustfall/screens/sending/sending_controller.dart';
import 'main.dart';
import 'screens/splash_screen/splash_screen_controller.dart';
import 'screens/signup/signup_controller.dart';
import 'screens/login/login_controller.dart';
import 'screens/home/home_controller.dart';

class Routes{
  Map<String, WidgetBuilder> get(BuildContext context, StartAppState startAppState){
    return {
      '/splash': (context) => SplashScreenController(startapp: startAppState),
      '/signup': (context) => SignupPageController(startapp: startAppState),
      '/login': (context) => LoginController(startapp: startAppState),
      '/home': (context) => HomeController(startapp: startAppState),
      '/about': (context) => AboutController(startapp: startAppState),
      '/sending': (context) => SendingController(startapp: startAppState),
    };
  }
}
