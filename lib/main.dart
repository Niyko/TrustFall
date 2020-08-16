import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';
import 'screens/splash_screen/splash_screen_controller.dart';

void main() {
  runApp(StartApp());
}

class StartApp extends StatefulWidget {
  StartApp({Key key}) : super(key: key);

  @override
  StartAppState createState() => StartAppState();
}

class StartAppState extends State<StartApp> {
  ThemeData currentTheme = AppThemes().light;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: currentTheme,
      title: "TrustFall",
      home: new SplashScreenController(
          startapp: this
      ),
      initialRoute: '/',
      routes: Routes().get(context, this),
    );
  }

  changeTheme(ThemeData themeData){
    setState(() {
      currentTheme = themeData;
    });
  }

  changeRoute(String route, BuildContext context){
    Navigator.pushNamed(context, route);
  }
}


























//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.green,
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//          fontFamily: 'Montserrat',
//      ),
//      home: MyHomePage(title: 'Hello World'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(
//        child: Padding(
//          padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
//          child: Column(
//            children: <Widget>[
//              SizedBox.fromSize(
//                size: Size(56, 56), // button width and height
//                child: ClipOval(
//                  child: Material(
//                    color: Colors.transparent, // button color
//                    child: InkWell(
//                      splashColor: Colors.black12, // splash color
//                      onTap: () {}, // button pressed
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Icon(Icons.arrow_back),
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
