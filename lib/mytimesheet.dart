import 'dart:convert';

import 'package:bonafide_app/applyleave.dart';
import 'package:bonafide_app/main.dart';
import 'package:bonafide_app/organizationprofile.dart';
import 'package:bonafide_app/timesheet_entry.dart';
import 'package:bonafide_app/updatetimesheet.dart';
import 'package:bonafide_app/util/constants.dart';
import 'package:bonafide_app/weekly_timesheet.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';


class MyTimesheet extends StatefulWidget {
  @override
  MyTimesheetState createState() {
    return MyTimesheetState();
  }

}


class MyTimesheetState extends State<MyTimesheet>{
  RefreshController _refreshControllerOnErrorReload = RefreshController(initialRefresh: false);
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  BuildContext context;
  Future<WeeklyTimesheet> timesheetEntries;
  var timesheetUrl = 'timesheet.php';

  @override
  void initState() {
    super.initState();
    timesheetEntries = _weekTimesheet(timesheetUrl);
  }
  Future<WeeklyTimesheet> _weekTimesheet(String url) async {
    final weekTimesheet = new WeeklyTimesheet();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var dio = Dio();
    FormData formData = new FormData.fromMap({
      "user_id": prefs.getString(Constants.SHARED_PREF_USER_ID),
    });
    dynamic response = await dio.post("http://boostmart.com/apiproject/"+url, data: formData);
    Map<String, dynamic> responseList = jsonDecode(response.toString());
    final list = List<TimesheetEntry>();
    if(responseList["data"]!=null){
      for (dynamic item in responseList["data"]) {
        list.add(TimesheetEntry(item['date'],item['time'], true));
      }
    }
    weekTimesheet.preUrl = responseList["preUrl"];
    weekTimesheet.nextUrl =  responseList["nextUrl"];
    weekTimesheet.startDate = responseList["start"];
    weekTimesheet.endDate = responseList["end"];
    weekTimesheet.weekEntries = list;

    return weekTimesheet;
  }



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
          actions: <Widget>[
            PopupMenuButton<String>(
                onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return Constants.TIMESHEET_MENU_CHOICES
                      .map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                })
          ],
        ),
        drawer: MainNavigationDrawer(),
        body: SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                  height:_height>_width? _height / 6: _width/6,
                  child: Center(
                      child: Image.asset(
                          "assets/images/timesheet_icon.png"))),
              SizedBox(height: 8,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0)),
                  color: Color(0xffFFFFFF),
                ),
                height: _height>_width?_height - _height/6 - 80  : _width - _width/6.5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,8, 0, 0),
                  child: FutureBuilder(
                    future: timesheetEntries,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                        case ConnectionState.active:
                          return Container(
                            alignment: Alignment.center,
                            child: SpinKitHourGlass(
                              color:  Color(0xffEB5050),
                              size: 50.0,
                            ),
                          );
                          break;
                        case ConnectionState.done:
                          if (snapshot.hasError) {
                            // return whatever you'd do for this case, probably an error
                            return SmartRefresher(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    //height: _height/2 - 80,
                                    alignment: Alignment.topCenter,
                                    width: _width,
                                    child: Image.asset("assets/images/no_internet.png",),
                                  ),

                                  Image.asset("assets/images/pulldown_refresh.png", height: 32,color: Colors.blue,),
                                  SizedBox(height: 8,),
                                  Text("Pull Down To Refresh", style: TextStyle(fontFamily: 'AvenirNext',fontSize: 13,color: Colors.blue,fontWeight: FontWeight.bold),),
                                ],
                              ),

                              controller: _refreshControllerOnErrorReload,
                              onRefresh: ()async{
                                var connectivityResult = await (Connectivity().checkConnectivity());
                                if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) =>MyTimesheet()));
                                } else  {
                                  Toast.show("Internet is still not up yet.. Try again", context,
                                      textColor: Colors.white,
                                      duration: Toast.LENGTH_LONG,
                                      gravity: Toast.BOTTOM,
                                      backgroundColor: Colors.blue,
                                      backgroundRadius: 16);
                                }
                                _refreshControllerOnErrorReload.refreshCompleted();
                              },
                            );
                          }
                          var data = snapshot.data as WeeklyTimesheet;
                          return Column(

                            children: <Widget>[
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      // side: BorderSide(width:2,color: Color(0xffEB5050))
                                    ),
                                    color:Color(0xffEB5050   ),
                                    elevation: 0,
                                    child: InkWell(
                                      onTap: () {
                                        navigateToWeek(data.preUrl);
                                      },
                                      child: Container(
                                        height: _width / 7.5,
                                        width: _width / 7.5,
                                        child: Center(
                                          child: Container(
                                            height: 16,
                                            width: 16,
                                            child: Image.asset(
                                              "assets/images/wk_back.png",),
                                          ),
                                        ),
                                      ),
                                    ),

                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                      // side: BorderSide(width:0,color: Color(0xffEB5050))
                                    ),
                                    color:Color(0xffEB5050),
                                    elevation: 0,
                                    child: Container(
                                      width: _width / 1.6,
                                      height: _width / 7,
                                      child: Center(
                                        child: Container(
                                          height: _width / 7,
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: <Widget>[

                                              Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(10, 0, 0, 0),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        data.startDate ,
                                                        style: TextStyle(
                                                            color:
                                                            Colors.white,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 15,
                                                            fontFamily:
                                                            'AvenirNext'),
                                                      ),
                                                      Text(
                                                        " - " + data.endDate ,
                                                        style: TextStyle(
                                                            color: Colors.white,
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
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    elevation: 0,
                                    color: Color(0xffEB5050),
                                    child: InkWell(
                                      onTap: () {
                                        navigateToWeek(data.nextUrl);
                                      },
                                      child: Container(
                                        height: _width / 7.5,
                                        width: _width / 7.5,
                                        child: Center(
                                          child: Container(
                                            height: 16,
                                            width: 16,
                                            child: Image.asset(
                                                "assets/images/wk_next.png"),
                                          ),
                                        ),
                                      ),
                                    ),

                                  ),
                                ],
                              ),
                              data.weekEntries.length==0?
                              Expanded(child: Image.asset("assets/images/empty_view.png")):
                              Expanded(
                                child: SmartRefresher(
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: data.weekEntries.length,
                                    itemBuilder: (BuildContext context, int index) => Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Card(

                                          child: Container(
                                            width: _width - 32,
                                            height: _width / 6,
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
                                                        child: Icon(Icons.calendar_today, size: 18, color: Colors.blueGrey,)),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                      child: Text(
                                                        data.weekEntries[index].day+" "+data.weekEntries[index].date,
                                                        style: TextStyle(
                                                            color: Color(0xff696969),
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
                                                        child: Icon(Icons.access_time, color: Colors.blueGrey,size: 18,)),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                      child: Text(
                                                        data.weekEntries[index].duration +" Hours",
                                                        style: TextStyle(
                                                            color: Color(0xff696969),
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
                                  controller: _refreshController,
                                  onRefresh: ()async{
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) =>MyTimesheet()));
                                    _refreshController.refreshCompleted();
                                  },
                                ),
                              ),

                            ],
                          );
                          break;
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }


  void choiceAction(String choice) {
    if (choice == Constants.MENU_ITEM_TIMESHEET) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => UpdateTimesheet()));
    }
  }

  void navigateToWeek(url) {
    setState(() {
      timesheetEntries = _weekTimesheet(url);
    });
  }


}