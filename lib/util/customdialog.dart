import 'dart:ui';

import 'package:bonafide_app/util/util.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String date, reason, buttonText, status;

  CustomDialog(
      {@required this.date,
      @required this.reason,
      @required this.buttonText,
      @required this.status});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Date:       ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black26,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    date,
                    textAlign: TextAlign.start,
                    style:
                    TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Reason:  ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black26,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    reason == '' || reason ==' ' ? "Not Available" : reason,
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  disabledColor: Color(0xffEB5050),
                  color: Colors.red,
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(16.0),
                      side: BorderSide(
                        color: Colors.white,
                      )),
                  child: Text(
                    buttonText,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Consts.padding,
          right: Consts.padding,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(64.0),
                  bottomRight: Radius.circular(64.0),
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16)
              ),

              color: quickDescBackgroundColor(status),
            ),
            child: Center(child: convertLeaveStatusToText(status)),
          ),
        ),
      ],
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 30.0;
}
