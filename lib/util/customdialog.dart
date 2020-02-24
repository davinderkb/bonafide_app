import 'dart:ui';

import 'package:bonafide_app/util/util.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String date, reason, status;

  CustomDialog(
      {@required this.date,
      @required this.reason,
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Text(
                    date,
                    textAlign: TextAlign.start,
                    style:
                    TextStyle(color: Color(0xff696969),fontSize: 14.0, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Reason:  ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black26,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    reason == '' || reason ==' ' ? "Not Available" : reason,
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontSize: 14.0,  color:Color(0xff696969),fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(height: 12.0),

            ],
          ),
        ),
        Positioned(
          left: Consts.padding,
          right: Consts.padding,
          child: CircleAvatar(
            radius: Consts.avatarRadius,
            backgroundColor: quickDescBackgroundColor(status),
            child: Center(child: convertLeaveStatusToText(status)),
          ),
        ),
        Positioned(
          left: Consts.padding,
          right: 0,
          child:Align(
            alignment: Alignment.topRight,
            child: FlatButton(

              onPressed: () {
                Navigator.of(context).pop(); // To close the dialog
              },
              child:  Icon(Icons.cancel, size: 50,color: quickDescBackgroundColor(status),
              ),

            ),
          ),

        ),
      ],
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 80.0;
}
