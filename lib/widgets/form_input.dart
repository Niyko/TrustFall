import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class IconFormInput extends StatefulWidget {
  IconFormInput({
    Key key,
    this.hint,
    this.icon,
    this.onChanged,
    this.obscureText = false,
    this.maxLength = 20,
    this.keyboardType = TextInputType.text
  }) : super(key: key);

  final String hint;
  final IconData icon;
  final Function onChanged;
  final bool obscureText;
  final int maxLength;
  final TextInputType keyboardType;

  @override
  _IconFormInputState createState() => _IconFormInputState();
}

class _IconFormInputState extends State<IconFormInput> {
  bool isTextShown = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 3.0, 15.0, 3.0),
          child: Row(
            children: <Widget>[
              Icon(
                widget.icon,
                color: Color(0xff09090B).withOpacity(0.3),
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  maxLength: widget.maxLength,
                  keyboardType: widget.keyboardType,
                  inputFormatters: (widget.keyboardType==TextInputType.number)? <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ]:[],
                  obscureText: (widget.obscureText)?isTextShown:false,
                  onChanged: widget.onChanged,
                  style: TextStyle(
                    fontSize: 15
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hint,
                      counterText: "",
                  ),
                ),
              ),
              if(widget.obscureText) SizedBox.fromSize(
                size: Size(40, 40), // button width and height
                child: ClipOval(
                  child: Material(
                    color: Colors.transparent, // button color
                    child: InkWell(
                      splashColor: Colors.black26, // splash color
                      onTap: () {
                        setState(() {
                          isTextShown = !isTextShown;
                        });
                      }, // button pressed
                      child: Icon(
                        (isTextShown)?OMIcons.visibility:OMIcons.visibilityOff,
                        size: 20,
                        color: Color(0xff09090B).withOpacity(0.3),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
