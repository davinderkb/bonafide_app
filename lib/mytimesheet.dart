import 'package:bonafide_app/applyleave.dart';
import 'package:bonafide_app/main.dart';
import 'package:bonafide_app/organizationprofile.dart';
import 'package:bonafide_app/updatetimesheet.dart';
import 'package:bonafide_app/util/constants.dart';
import 'package:flutter/material.dart';

class MyTimesheet extends StatelessWidget {
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xffEB5050),
        appBar: new AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                new Text(
                  "Timesheet",
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
        body: SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36.0),
                      topRight: Radius.circular(36.0)),
                  color: Color(0xffFFFFFF),
                ),
                height: _height,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Column(

                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(36.0)),
                              color: Color(0xffFFFFFF),
                              border: Border.all(color: Color(0xffD9C3CF)),
                            ),
                            height: 60,
                            width:  _width,
                            child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  width: 20,
                                  child: FlatButton(onPressed: null, child: new Text(
                                    "<",
                                    style: new TextStyle(
                                        fontFamily: 'AvenirNext',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.red),
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                                Container(
                                  width: _width/2.0,
                                  child: new Text(
                                    "Feb 10, 2020 - Feb 16, 2020",
                                    style: new TextStyle(
                                        fontFamily: 'AvenirNext',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                       color:  Colors.black54,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  width: 20,
                                  child: FlatButton(onPressed: null, child: new Text(
                                    ">",
                                    style: new TextStyle(
                                        fontFamily: 'AvenirNext',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color:  Colors.red),
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        height: _height/1.7,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: 7,
                                itemBuilder: (BuildContext context, int index) => Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Card(
                                      child: Container(
                                        width: _width - 32,
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
                                                    height: 24,
                                                    width: 24,
                                                    child: Image.asset(
                                                        "assets/images/ic_date_blue.png")),
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                                  child: Text(
                                                    "Monday, Feb 10, 2020",
                                                    style: TextStyle(
                                                        color: Color(0xff019C9D),
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                        fontFamily: 'AvenirNext'),
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
                                                    height: 24,
                                                    width: 24,
                                                    child: Image.asset(
                                                        "assets/images/ic_time.png")),
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                                  child: Text(
                                                    "8.0 Hours",
                                                    style: TextStyle(
                                                        color: Color(0xff019C9D),
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                        fontFamily: 'AvenirNext'),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
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
                        padding: const EdgeInsets.fromLTRB(0,8,0,0),
                        child: Container(
                          height: 56,
                          width: _width/1.2,

                          child: FlatButton.icon(
                            label: Text('Add Mssing Hours',textAlign: TextAlign.start,style: TextStyle(fontSize: 14, color: Colors.white),),
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>UpdateTimesheet()));
                            },
                            icon: Icon(Icons.access_time, color: Colors.white,),
                            disabledColor: Color(0xffEB5050),
                            color: Color(0xffEB5050),
                            shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(32.0),side: BorderSide(color: Colors.white)),
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
