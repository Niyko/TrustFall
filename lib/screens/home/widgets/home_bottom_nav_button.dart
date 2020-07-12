import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import '../../../theme.dart';

class HomeBottomNavButton extends StatefulWidget {
  HomeBottomNavButton({
    Key key,
    this.title = "",
    this.image,
    this.imageHeight = 22.0,
    this.onClick,
  }) : super(key: key);

  final String title;
  final ImageProvider image;
  final double imageHeight;
  final Function onClick;

  @override
  _HomeBottomNavButtonState createState() => _HomeBottomNavButtonState();
}

class _HomeBottomNavButtonState extends State<HomeBottomNavButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Material(
          color: Colors.white, // button color
          child: InkWell(
            splashColor: Colors.black12, // splash color
            onTap: () {}, // button pressed
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 11.0, 0, 9.0),
              child: Column(
                children: <Widget>[
                  Image(
                    image: widget.image,
                    height: widget.imageHeight,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.title.toUpperCase(),
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
