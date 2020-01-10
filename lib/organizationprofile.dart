import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bonafide_app/main.dart';
import 'dart:ui' as ui;
import 'package:bonafide_app/util/constants.dart';

class OrganizationProfile extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return new Stack(
      children: <Widget>[
        new Container(
          color: Colors.blue,
        ),
        new BackdropFilter(
            filter: new ui.ImageFilter.blur(
              sigmaX: 6.0,
              sigmaY: 6.0,
            ),
            child: new Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.9),
                borderRadius: BorderRadius.all(
                    Radius.circular(50.0)),
              ),
            )),
        new Scaffold(

            drawer: MainNavigationDrawer(),
            appBar: new AppBar(
              title: new Text(Constants.ORGANIZATION_PROFILE),
              centerTitle: false,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: Colors.indigoAccent,
            body: new Center(
              child: SingleChildScrollView(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new SizedBox(
                      height: _height / 12,
                    ),
                    new CircleAvatar(
                      radius: _width < _height
                          ? _width / 4.8
                          : _height /
                          5,

                      backgroundImage:
                      AssetImage('assets/images/bonafide-b.png'),
                      backgroundColor: Colors.blue[50]
                      ,
                    ),
                    new SizedBox(
                      height: _height / 25.0,
                    ),
                    new Text(
                      Constants.ORGANIZATION_TITLE,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _width / 15,
                          color: Colors.blue[50]),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(
                          top: _height / 30,
                          left: _width / 8,
                          right: _width / 8),
                      child: new Text(
                        Constants.ORGANIZATION_TAG_LINE +
                            '\n' +
                            Constants.ORGANIZATION_TAG_DESC,
                        style: new TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: _width / 25,
                            color: Colors.blue[50]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Divider(
                      height: _height / 30,
                      color: Colors.white,
                    ),
                    new Row(
                      children: <Widget>[
                        rowCell(212, Constants.EMPLOYEES,),
                        rowCell(67, Constants.CLIENT),
                        rowCell(375, Constants.PROJECTS),
                      ],
                    ),
                    new Divider(
                        height: _height / 30,
                        color: Colors.white),
                    new Padding(
                      padding: new EdgeInsets.only(
                          left: _width / 8, right: _width / 8),
                      child: new FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.blue[50],
                        onPressed: () {},
                        child: new Container(
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center,
                              children: <Widget>[
                                new Icon(Icons.contact_mail,color: Colors.black,),
                                new SizedBox(
                                  width: _width / 30,
                                ),
                                new Text(Constants.FEEDBACK,style: TextStyle(color: Colors.black),)
                              ],
                            ),
                        ),

                      ),
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }

  Widget rowCell(int count, String type) => new Expanded(
          child: new Column(
        children: <Widget>[
          new Text(
            '$count',
            style: new TextStyle(color: Colors.blue[50]),
          ),
          new Text(type,
              style: new TextStyle(
                  color: Colors.blue[50], fontWeight: FontWeight.normal))
        ],
      ));
}
