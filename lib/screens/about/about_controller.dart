import 'package:flutter/material.dart';
import 'package:trustfall/main.dart';
import 'about_view.dart';

class AboutController extends StatefulWidget {
  final StartAppState startapp;

  AboutController({
    Key key,
    this.startapp
  }) : super(key: key);

  @override
  AboutState createState() => AboutState();
}

class AboutState extends State<AboutController> {
  BuildContext buildContext;

  @override
  Widget build(BuildContext context) {
    return new AboutView().get(this);
  }

}