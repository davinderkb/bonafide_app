import 'package:bonafide_app/applyleave.dart';
import 'package:bonafide_app/main.dart';
import 'package:bonafide_app/manageleaves_schema.dart';
import 'package:bonafide_app/util/constants.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:bonafide_app/util/customdialog.dart';
import 'package:bonafide_app/util/util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:ui' show ImageFilter;





class ManageLeaves extends StatefulWidget {
  @override
  ManageLeavesState createState() {
    return ManageLeavesState();
  }
}

var manageLeavesUrl = 'http://boostmart.com/apiproject/manage-leave.php';
Future<List<ManageLeavesSchema>> _appliedLeaves() async {
  final list = List<ManageLeavesSchema>();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var dio = Dio();
  FormData formData = new FormData.fromMap({
    "user_id": prefs.getString(Constants.SHARED_PREF_USER_ID),
  });
  dynamic response = await dio.post(manageLeavesUrl, data: formData);
  Map<String, dynamic> responseList = jsonDecode(response.toString());
  for (dynamic item in responseList["data"]) {
    list.add(ManageLeavesSchema.fromJson(item));
  }
  return list;
}

class ManageLeavesState extends State<ManageLeaves> {
  Future<List<ManageLeavesSchema>> futureListOfAppliedLeaves;
  RefreshController _refreshControllerOnErrorReload = RefreshController(initialRefresh: false);
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  @override
  void initState() {
    super.initState();
    futureListOfAppliedLeaves = _appliedLeaves();
  }

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
                  "My Leaves",
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
                  return Constants.MANAGE_LEAVE_MENU_CHOICES
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
                  height: _height / 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 16),
                    child: Center(
                        child: Image.asset(
                            "assets/images/manage_leaves_header.png")),
                  )),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  color: Color(0xffFFF8F8),
                ),
                height: _height - (_height / 5) - 80,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: FutureBuilder(
                          future: futureListOfAppliedLeaves,
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
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) =>ManageLeaves()));
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
                                var data = snapshot.data;
                                return SmartRefresher(
                                  child: new ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Card(
                                          child: Container(
                                            width: _width / 1.5,
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
                                                        height: 24,
                                                        width: 24,
                                                        child: Image.asset(
                                                            "assets/images/ic_date.png")),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(10, 0, 0, 0),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Text(
                                                            data[index].fromDate ,
                                                            style: TextStyle(
                                                                color:
                                                                Color(0xff666666),
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                'AvenirNext'),
                                                          ),
                                                          Text(
                                                            " - " +data[index].toDate ,
                                                            style: TextStyle(
                                                                color:data[index].toDate == data[index].fromDate?Colors.white:Color(0xff666666),
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                fontSize: 14,
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
                                          color: quickDescBackgroundColor(data[index].status),
                                          child: InkWell(
                                            onTap: () {
                                                  child: _showLeaveDetails(data[index].status,data[index].fromToDate, data[index].reason );
                                            },
                                            child: Container(
                                              height: _width / 7.5,
                                              width: _width / 7.5,
                                              child: Center(
                                                child: Container(
                                                  height: 16,
                                                  width: 16,
                                                  child: Image.asset(
                                                      "assets/images/ic_short_desc.png"),
                                                ),
                                              ),
                                            ),
                                          ),

                                        ),
                                        Card(
                                          child: InkWell(
                                            onTap: () {
                                              /*DateFormat format = new DateFormat("MMM dd, yyyy");
                                              if(format.parse(data[index].toDate).isBefore(new DateTime.now())){
                                                Toast.show("Cannot delete past leaves", context,
                                                    textColor: Colors.white,
                                                    duration: Toast.LENGTH_SHORT,
                                                    gravity: Toast.BOTTOM,
                                                    backgroundColor: Color(0xffEB5050),
                                                    backgroundRadius: 16);
                                              } else{

                                              }*/
                                              _deleteLeave(data[index].id);
                                            },
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
                                        ),
                                      ],
                                    ),
                                  ),
                                  controller: _refreshController,
                                  onRefresh: ()async{
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) =>ManageLeaves()));
                                    _refreshController.refreshCompleted();
                                  },
                                );
                                break;
                            }
                          },
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


  void choiceAction(String choice) {
    if (choice == Constants.MENU_ITEM_APPLY_LEAVE) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => ApplyLeave()));
    }
  }

  Future<void> _deleteLeave(String id) async {
    var dio = Dio();
    var deleteLeavesUrl = 'http://boostmart.com/apiproject/delete_leave.php';
    FormData formData = new FormData.fromMap({
      "leave_id": id,
    });
    dynamic response = await dio.post(deleteLeavesUrl, data: formData);
    if (response.toString() == "Delete Successful") {
      Toast.show("Leave deleted successfully", context,
          textColor: Colors.white,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.BOTTOM,
          backgroundColor: Color(0xffEB5050),
          backgroundRadius: 16);
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ManageLeaves()));
    } else {
      Toast.show("Problem while deleting Leave, Try again !!", context,
          textColor: Colors.white,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.BOTTOM,
          backgroundColor: Color(0xffEB5050),
          backgroundRadius: 16);
    }
  }

  Widget _showLeaveDetails(status, fromToDate, reason) {
    showDialog(
      context: context,
      builder: (BuildContext context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX:2.0,sigmaY:2.0),
        child: CustomDialog(
          date: fromToDate,
          reason:reason,
          status: status,
        ),
      ),
    );
  }

}
