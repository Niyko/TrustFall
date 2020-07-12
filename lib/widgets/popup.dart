import 'package:flutter/material.dart';
import 'package:snack/snack.dart';

class Popup {
  void show(String msg, BuildContext context){
    SnackBar(content: Text(msg)).show(context);
  }
}