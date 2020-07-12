import 'package:flutter/material.dart';
import 'package:trustfall/theme.dart';

class InfoModal {

  InfoModal({
    this.context,
    this.title,
    this.description,
    this.isCloseEnabled = false,
    this.isPostiveBtnEnabled = false,
    this.isNegativeBtnEnabled = false,
    this.postiveBtnText = "yes",
    this.postiveBtnOnClick,
    this.negativeBtnText = "no",
    this.negativeBtnOnClick
  });

  final BuildContext context;
  final String title;
  final String description;
  final bool isCloseEnabled;
  final bool isPostiveBtnEnabled;
  final bool isNegativeBtnEnabled;
  final String postiveBtnText;
  final Function postiveBtnOnClick;
  final String negativeBtnText;
  final Function negativeBtnOnClick;

  Dialog view(BuildContext context){
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          width: 300.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                child: Column(
                  children: <Widget>[
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ThemeColors().black.withOpacity(0.4)
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    if(isPostiveBtnEnabled) Expanded(
                      child: FlatButton(
                        color: ThemeColors().light_yellow,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: postiveBtnOnClick,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            postiveBtnText.toUpperCase(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0,
                                color: ThemeColors().black
                            ),
                          ),
                        ),
                      ),
                    ),
                    if(isNegativeBtnEnabled) Expanded(
                      child: FlatButton(
                        color: ThemeColors().light_yellow.withOpacity(0.8),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: negativeBtnOnClick,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            negativeBtnText.toUpperCase(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0,
                                color: ThemeColors().black
                            ),
                          ),
                        ),
                      ),
                    ),
                    if(isCloseEnabled) Expanded(
                      child: FlatButton(
                        color: ThemeColors().light_yellow.withOpacity(0.8),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "close".toUpperCase(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0,
                                color: ThemeColors().black
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  show(){
    showDialog(context: context, builder: (BuildContext context) => this.view(context));
  }
}