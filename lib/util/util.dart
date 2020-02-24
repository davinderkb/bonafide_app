import 'package:flutter/material.dart';


Widget rowCell(String count, String type) => new Expanded(
    child: new Column(
      children: <Widget>[
        new Text(
          '$count',
          style: new TextStyle(fontFamily: 'AvenirNext',color: Colors.blue[50]),
        ),
        new Text(type,
            style: new TextStyle(fontFamily: 'AvenirNext',
                color: Colors.blue[50], fontWeight: FontWeight.bold))
      ],
    ));

Color quickDescBackgroundColor(String status) {
  switch (int.parse(status)) {
    case 1:
      {
        return Color(0xff13D178);
      }
      break;
    case 2:
      {
        return Color(0xffD1133A);
      }
      break;
    default:
      {
        return Color(0xffFF950A);
      }
      break;
  }
}

Text convertLeaveStatusToText(String status) {
  switch (int.parse(status)) {
    case 1:
      {
        return Text(
          "Approved",
          style: new TextStyle(
              fontFamily: 'AvenirNext',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xffFFFFFF)),
          textAlign: TextAlign.center,
        );
      }
      break;
    case 2:
      {
        return Text(
          "Declined",
          style: new TextStyle(
              fontFamily: 'AvenirNext',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xffFFFFFF)),
          textAlign: TextAlign.center,
        );      }
      break;
    default:
      {
        return Text(
          "Pending\nfor approval",
          style: new TextStyle(
              fontFamily: 'AvenirNext',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xffFFFFFF)),
          textAlign: TextAlign.center,
        );      }
      break;
  }
}
