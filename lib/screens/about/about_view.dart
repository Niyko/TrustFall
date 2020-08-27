import 'package:flutter/material.dart';
import 'about_controller.dart';

class AboutView {
  Scaffold get(AboutState aboutState){
    return new Scaffold(
        backgroundColor: Colors.white,
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: Container(
            ),
          ),
        )
    );
  }
}