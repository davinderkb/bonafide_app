import 'package:bonafide_app/applyleave.dart';
import 'package:bonafide_app/main.dart';
import 'package:bonafide_app/manageleaves_schema.dart';
import 'package:bonafide_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';

class ManageLeaves extends StatefulWidget {




  @override
  ManageLeavesState createState() {
    return ManageLeavesState();
  }
}


var manageLeavesUrl = 'http://boostmart.com/apiproject/manage-leave.php';
Future<List<ManageLeavesSchema>>_appliedLeaves() async {
  final list = List<ManageLeavesSchema>();
  var dio = Dio();
  FormData formData = new FormData.fromMap({
    "user_id": "1",
  });
  dynamic response = await dio.post(manageLeavesUrl, data: formData);
  Map<String,dynamic> responseList = jsonDecode(response.toString());
  for(dynamic item in responseList["data"]){
    list.add(ManageLeavesSchema.fromJson(item));
  }
  return list;
}

class ManageLeavesState extends State<ManageLeaves>{
  Future<List<ManageLeavesSchema>> futureListOfAppliedLeaves;


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
                itemBuilder: (BuildContext context){
                  return Constants.MANAGE_LEAVE_MENU_CHOICES.map((String choice){
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                }
            )
          ],
        ),
        drawer: MainNavigationDrawer(),
        body: SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                  height:_height/5  ,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0,0,8,16),
                    child: Center(child: Image.asset("assets/images/manage_leaves_header.png")),
                  )
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)
                  ),
                  color: Color(0xffFFF8F8),
                ),
                height: _height - (_height/5) - 80,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,8,0,0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child:FutureBuilder(
                          future: futureListOfAppliedLeaves,
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                              case ConnectionState.waiting:
                              case ConnectionState.active:
                                return Container(
                                  alignment: Alignment.center,
                                  child: Text("Loading Leaves..."),
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
                                return new ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: data.length,
                                  itemBuilder: (BuildContext context, int index) => Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Card(
                                        child:
                                        Container(
                                          width: _width/1.5,
                                          height: _width/7.5,
                                          child: Center(
                                            child: Container(
                                              height: _width/7,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(height:24, width: 24,child: Image.asset("assets/images/ic_date.png")),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(10,0,0,0),
                                                    child: Text(data[index].fromDate +" - "+data[index].toDate,style: TextStyle(color:Color(0xff656D71),  fontWeight: FontWeight.bold,fontSize: 14, fontFamily: 'AvenirNext'),),
                                                  ),

                                                ],),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Card(
                                        color: quickDescBackgroundColor(data[index].status),
                                        child:
                                        Container(
                                          height: _width/7.5,
                                          width: _width/7.5,
                                          child: Center(
                                            child: Container(
                                              height: 16,
                                              width: 16,
                                              child: Image.asset("assets/images/ic_short_desc.png"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Card(
                                        child:
                                        Container(
                                          height: _width/7.5,
                                          width: _width/7.5,
                                          child: Center(
                                            child: Container(
                                              height: 16,
                                              width: 16,
                                              child: Image.asset("assets/images/ic_delete.png"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],

                                  ),
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

  Color quickDescBackgroundColor(String status) {
    switch(int.parse(status)) {
      case 1: {
        return Color(0xff13D178);
      }
      break;
      case 2: {
        return Color(0xffD1133A);
      }
      break;
      default: {
        return Color(0xffFF950A);
      }
      break;
    }
}


  void choiceAction(String choice) {
    if(choice == Constants.MENU_ITEM_APPLY_LEAVE){
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>ApplyLeave()));
    }
  }
}