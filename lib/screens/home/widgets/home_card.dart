import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import '../../../theme.dart';

class HomeCard extends StatefulWidget {
  HomeCard({
    Key key,
    this.title = "",
    this.description = "",
    this.textColor,
    this.image,
    this.imageWidth = 35.0,
    this.color,
    this.splashColor = Colors.black12,
    this.onClick,
    this.width = 0,
  }) : super(key: key);

  final String title;
  final String description;
  final Color textColor;
  final Color color;
  final Color splashColor;
  final ImageProvider image;
  final double imageWidth;
  final double width;
  final Function onClick;

  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (widget.width==0)?null:widget.width,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Color(0xff09090B).withOpacity(0.07),
              blurRadius: 10.0,
              spreadRadius: 4.0,
            ),
          ]
      ),
      child: SizedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Material(
            color: widget.color,
            child: InkWell(
              splashColor: widget.splashColor, // splash color
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image(
                      image: widget.image,
                      width: widget.imageWidth,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    if(widget.title!="") Text(
                      widget.title.toUpperCase(),
                      style: TextStyle(
                        color: widget.textColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20
                      ),
                    ),
                    if(widget.title!="") SizedBox(
                      height: 5,
                    ),
                    if(widget.title!="") Text(
                      widget.description,
                      style: TextStyle(
                          color: widget.textColor.withOpacity(0.4),
                          fontWeight: FontWeight.w600,
                          fontSize: 12
                      ),
                    )
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
