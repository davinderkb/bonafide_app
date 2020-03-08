import 'package:bonafide_app/organization_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bonafide_app/main.dart';
import 'dart:ui' as ui;
import 'package:bonafide_app/util/constants.dart';
import 'package:bonafide_app/util/util.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OrganizationProfile extends StatefulWidget {
  @override
  OrganizationDetailsState createState() {
    return OrganizationDetailsState();
  }
}

class OrganizationDetailsState extends State<OrganizationProfile> {
  dynamic org;

  @override
  void initState() {
    super.initState();
    // this should not be done in build method
    org = _getOrganizationDetails();
  }

  @override
  Widget build(BuildContext context) {
    _getOrganizationDetails();
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
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            )),
        new Scaffold(
            appBar: new AppBar(
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    new Text(
                      "Organization Details",
                      style: new TextStyle(
                          fontFamily: 'AvenirNext',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFFFFF)),
                      textAlign: TextAlign.center,
                    ),
                  ]),
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: Color(0xffEB5050),
            ),
            drawer: MainNavigationDrawer(),
            backgroundColor: Color(0xffEB5050),
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
                      radius: _width < _height ? _width / 4.5 : _height / 5,
                      backgroundImage:
                          AssetImage('assets/images/bonafide-b.png'),
                      backgroundColor: Colors.blue[50],
                    ),
                    new SizedBox(
                      height: _height / 25.0,
                    ),
                    new Text(
                      Constants.ORGANIZATION_TITLE,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'AvenirNext',
                          fontSize: 25,
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
                            fontFamily: 'AvenirNext',
                            fontSize: 15,
                            color: Colors.blue[50]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new Divider(
                      height: _height / 30,
                      color: Colors.white,
                    ),
                    FutureBuilder(
                      future: org,
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                          case ConnectionState.active:
                            return Container(
                              alignment: Alignment.center,
                              child: SpinKitHourGlass(
                                color: Color(0xffFFFFFF),
                                size: 50.0,
                              ),
                            );
                            break;
                          case ConnectionState.done:
                            if (snapshot.hasError) {
                              // return whatever you'd do for this case, probably an error
                              return Container(
                                alignment: Alignment.center,
                                child: Text("Error: ${snapshot.error}"),
                              );
                            }
                            var data = snapshot.data;
                            return new Row(
                              children: <Widget>[
                                rowCell(data.employees,Constants.EMPLOYEES,),
                                rowCell(data.clients, Constants.CLIENT),
                                rowCell(data.projects, Constants.PROJECTS),
                              ],
                            );
                            break;
                        }
                      },
                    ),
                    new Divider(height: _height / 30, color: Colors.white),
                    new Padding(
                      padding: new EdgeInsets.only(
                          left: _width / 8, right: _width / 8),
                      child: new FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.blue[50],
                        onPressed: () {_sendMail();},
                        child: new Container(
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Icon(
                                Icons.contact_mail,
                                color: Colors.black,
                              ),
                              new SizedBox(
                                width: _width / 30,
                              ),
                              new Text(
                                Constants.FEEDBACK,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'AvenirNext',
                                    fontWeight: ui.FontWeight.bold),
                              )
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

  var organizationDetailsUrl =
      'http://boostmart.com/apiproject/org_details.php';
  Future<OrganizationDetails> _getOrganizationDetails() async {
    dynamic response = await http.get(organizationDetailsUrl);
    Map<String, dynamic> responseList = jsonDecode(response.body);
    for (dynamic item in responseList["data"]) {
      if (item['company'] == 'Bonafide') {
        return OrganizationDetails.fromJson(item);
      }
    }
  }

  void _sendMail() async {
    final Email email = Email(
      body: '',
      subject: 'Employee Feedback',
      recipients: ['naresh@bonafidetech.com'],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }
}
