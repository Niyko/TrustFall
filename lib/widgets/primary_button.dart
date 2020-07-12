import 'package:flutter/material.dart';
import 'package:trustfall/theme.dart';

class PrimaryButton extends StatefulWidget {
  PrimaryButton({
    Key key,
    this.text,
    this.isLoading,
    this.onClick,
  }) : super(key: key);

  final String text;
  final bool isLoading;
  final Function onClick;

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Container(
          height: 55,
          decoration: BoxDecoration(
              color: ThemeColors().light_yellow,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff09090B).withOpacity(0.04),
                  blurRadius: 10.0,
                  spreadRadius: 4.0,
                ),
              ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.black26, // splash color
                onTap: widget.onClick,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    if(widget.isLoading) SizedBox(
                      height: 15.0,
                      width: 15.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(ThemeColors().black),
                        strokeWidth: 3,
                      ),
                    ),
                    if(!widget.isLoading) Text(
                      widget.text.toUpperCase(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0,
                        color: ThemeColors().black
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
