import 'package:bonafide_app/applyleave.dart';
import 'package:bonafide_app/main.dart';
import 'package:bonafide_app/organizationprofile.dart';
import 'package:bonafide_app/util/constants.dart';
import 'package:flutter/material.dart';

class UpdateTimesheet extends StatelessWidget {
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xffEB5050),
        appBar: new AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  new Text(
                    "Update Timesheet",
                    style: new TextStyle(
                        fontFamily: 'AvenirNext',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(360.0)),
                      color: Color(0xffEB5050),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Center(
                      child: FlatButton(
                          onPressed: null,
                          child: new Text(
                            "+",
                            style: new TextStyle(
                                fontFamily: 'AvenirNext',
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ),
                ]),
          ),
          centerTitle: false,
          elevation: 5.0,
          backgroundColor: Color(0xffEB5050),
        ),
        drawer: MainNavigationDrawer(),
        body: SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0)),
                  color: Color(0xffFFFFFF),
                ),
                height: _height,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: _height / 1.35,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: 1,
                                itemBuilder:
                                    (BuildContext context, int index) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Card(
                                      child: Container(
                                        width: _width - _width / 7.5 - 32,
                                        height: _width / 7.5,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                    height: 20,
                                                    width: 20,
                                                    child: Image.asset(
                                                        "assets/images/ic_date.png")),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                  child: Text(
                                                    "Tue, Feb 11, 2020",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff656D71),
                                                        fontSize: 12,
                                                        fontFamily:
                                                            'AvenirNext'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                    height: 20,
                                                    width: 20,
                                                    child: Image.asset(
                                                        "assets/images/ic_time_grey.png")),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                  child: Text(
                                                    "8.0 Hours",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff656D71),
                                                        fontSize: 12,
                                                        fontFamily:
                                                            'AvenirNext'),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: Container(
                                        height: _width / 7.5,
                                        width: _width / 7.5,
                                        child: Center(
                                          child: Container(
                                            height: 16,
                                            width: 16,
                                            child: Image.asset(
                                                "assets/images/ic_delete.png"),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Container(
                          height: 56,
                          width: _width / 1.2,
                          child: FlatButton.icon(
                            label: Text(
                              'Submit Timesheet',
                              textAlign: TextAlign.start,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            onPressed: () {},
                            icon: Icon(
                              Icons.playlist_add_check,
                              color: Colors.white,
                            ),
                            disabledColor: Color(0xffEB5050),
                            color: Color(0xffEB5050),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(32.0),
                                side: BorderSide(color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
