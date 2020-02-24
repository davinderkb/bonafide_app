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
          backgroundColor:  Color(0xffEB5050),

        ),
        drawer: MainNavigationDrawer(),
        body: SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                  height:_height>_width? _height / 5: _width/5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 16),
                    child: Center(
                        child: Image.asset(
                            "assets/images/timesheet_icon.png")),
                  )),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0)),
                  color: Color(0xffFFFFFF),
                ),
                height: _height>_width?_height - _height/5 : _width - _width/5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Column(

                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0,0,10,0),
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: <Widget>[
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                                  side: BorderSide(width:2,color: Color(0xffEB5050))
                              ),
                              color:Color(0xffFFFFFF ),
                              child: InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  height: _width / 7.5,
                                  width: _width / 7.5,
                                  child: Center(
                                    child: Container(
                                      height: 16,
                                      width: 16,
                                      child: Image.asset(
                                          "assets/images/wk_back.png",color: Color(0xffEB5050),),
                                    ),
                                  ),
                                ),
                              ),

                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(width:1,color: Color(0xffEB5050))
                              ),
                              color:Color(0xffFFFFFF),
                              child: Container(
                                width: _width / 1.6,
                                height: _width / 7.5,
                                child: Center(
                                  child: Container(
                                    height: _width / 7,
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                            width: 0,
                                            child: Image.asset(
                                                "")),
                                        Padding(
                                            padding: const EdgeInsets
                                                .fromLTRB(10, 0, 0, 0),
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  "Feb 10, 2020" ,
                                                  style: TextStyle(
                                                      color:
                                                      Color(0xffEB5050),
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontSize: 15,
                                                      fontFamily:
                                                      'AvenirNext'),
                                                ),
                                                Text(
                                                  " — " +"Feb 16, 2020" ,
                                                  style: TextStyle(
                                                      color: Color(0xffEB5050),
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontSize: 15,
                                                      fontFamily:
                                                      'AvenirNext'),
                                                ),
                                              ],
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                                  side: BorderSide(width:2,color: Color(0xffEB5050))
                              ),
                              color: Color(0xffFFFFFF),
                              child: InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  height: _width / 7.5,
                                  width: _width / 7.5,
                                  child: Center(
                                    child: Container(
                                      height: 16,
                                      width: 16,
                                      child: Image.asset(
                                          "assets/images/wk_next.png", color: Color(0xffEB5050),),
                                    ),
                                  ),
                                ),
                              ),

                            ),
                          ],
                        ),
                      ),
                      new SizedBox(height: 0,),
                      Container(
                        height: _height/2.3,
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
                                                        "assets/images/ic_date.png")),
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                                  child: Text(
                                                    "Monday, Feb 10, 2020",
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontSize: 15,
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
                                                        "assets/images/ic_time_grey.png")),
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                                  child: Text(
                                                    "8.0 Hours",
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontSize: 15,
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
                        padding: const EdgeInsets.fromLTRB(0,16,0,0),
                        child: Container(
                          height: 56,
                          width:  _width / 1.1,

                          child: FlatButton.icon(
                            label: Text('Add Mssing Hours',textAlign: TextAlign.start,style: TextStyle(fontSize: 14, color: Color(0xffFFFFFF), fontWeight: FontWeight.bold),),
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>UpdateTimesheet()));
                            },
                            icon: Icon(Icons.access_time, color: Color(0xffFFFFFF),),
                            disabledColor: Color(0xffEB5050),
                            color: Color(0xffEB5050),
                            shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(32.0),side: BorderSide(width:2,color: Color(0xffFFFFFF))),
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
