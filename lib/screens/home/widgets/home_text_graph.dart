import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../theme.dart';

class HomeTextGraph extends StatefulWidget {
  HomeTextGraph({
    Key key,
    this.text = "",
    this.value = "",
  }) : super(key: key);

  final String text;
  final String value;

  @override
  _HomeTextGraphState createState() => _HomeTextGraphState();
}

class _HomeTextGraphState extends State<HomeTextGraph> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if(widget.value!="") Text(
            widget.value,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 25,
              color: ThemeColors().black,
            ),
          ),
          if(widget.value=="") Column(
            children: <Widget>[
              SizedBox(
                width: 30,
                height: 20.0,
                child: Shimmer.fromColors(
                  baseColor: Color(0xfff1f1f1),
                  highlightColor: Colors.white,
                  child: Container(
                    height: 20,
                    color: Color(0xfff1f1f1),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3,
          ),
          if(widget.value!="") Text(
            widget.text.toUpperCase(),
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 10,
                color: ThemeColors().black,
                fontWeight: FontWeight.w700
            ),
          ),
          if(widget.value=="") Column(
            children: <Widget>[
              SizedBox(
                width: 80,
                height: 10.0,
                child: Shimmer.fromColors(
                  baseColor: Color(0xfff1f1f1),
                  highlightColor: Colors.white,
                  child: Container(
                    height: 20,
                    color: Color(0xfff1f1f1),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
