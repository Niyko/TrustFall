import 'package:flutter/material.dart';

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
    };
  }
}
