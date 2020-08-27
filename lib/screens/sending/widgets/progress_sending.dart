import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import '../../../theme.dart';

class ProgressSending extends StatefulWidget {
  ProgressSending({
    Key key,
    this.progress = 0,
    this.width = 230,
  }) : super(key: key);

  final double progress;
  final double width;

  @override
  _ProgressSendingState createState() => _ProgressSendingState();
}

class _ProgressSendingState extends State<ProgressSending> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.6,
      child: Container(
        width: widget.width,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Sending".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13
                  ),
                ),
                Spacer(),
                Text("${widget.progress.round()}%",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Stack(
              children: <Widget>[
                Opacity(
                  opacity: 0.4,
                  child: SizedBox(
                    width: 230,
                    height: 6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Material(
                        color: ThemeColors().black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: (widget.progress/100)*widget.width,
                  height: 6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Material(
                      color: ThemeColors().black,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
