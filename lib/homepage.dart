import 'package:bonafide_app/main.dart';
import 'package:bonafide_app/manageleaves.dart';
import 'package:bonafide_app/mytimesheet.dart';
import 'package:bonafide_app/util/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage() {}

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          iconTheme: new IconThemeData(color: Color(0xff262B31)),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                new Text(
                  "Home",
                  style: new TextStyle(
                      fontFamily: 'AvenirNext',
                      fontSize: 18,
                      color: Color(0xff262B31)),
                  textAlign: TextAlign.center,
                )
              ]),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        drawer: MainNavigationDrawer(),
        body: SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new SizedBox(height: 5,),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    new SizedBox(width: 25,),
                    Image.asset(
                      "assets/images/ic_touch_2.png",
                      height: 30,
                      width: 22,
                    ),
                    new SizedBox(width: 15,),
                    new Text(
                      "Employee Services",
                      style: new TextStyle(
                          fontFamily: 'AvenirNext',
                          fontSize: 14,
                          color: Color(0xff7F7F7F)),
                      textAlign: TextAlign.center,
                    )
                  ]),
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0,18,25.0,12),
                child: new FlatButton(
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                  color: Color(0xff0072FF),
                  onPressed: () {
                    onManageLeavePress(context);
                  },
                  child: new Container(
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25,0,25,0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                  new Text("Manage Leaves",style: TextStyle(fontFamily:'AvenirNext', fontSize:14,color: Colors.white)),
                                  new SizedBox(height: 6.15,),
                                  new Text("View/ Edit/ Apply Leaves",style: TextStyle(fontFamily:'AvenirNext', fontSize:11,color: Color(0xff9BC7FF))),
                          ]),
                            new Image.asset("assets/images/ic_leaves.png", height: 35, width: 35,),

                        ],
                      ),
                    ),
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0,0,25.0,22),
                child: new FlatButton(
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                  color: Color(0xffEB5050),
                  onPressed: () {
                    onTimesheetPress(context);
                  },
                  child: new Container(
                    height: 70,

                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25,0,25,0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text("Timesheet",style: TextStyle(fontFamily:'AvenirNext', fontSize:14,color: Colors.white)),
                                new SizedBox(height: 6.15,),
                                new Text("View & Add/Edit Missing Hours",style: TextStyle(fontFamily:'AvenirNext', fontSize:11,color: Color(0xffF7BBBB))),
                              ]),
                          new Image.asset("assets/images/ic_timesheet.png", height: 35, width: 35,),
                        ],
                      ),
                    ),
                  ),

                ),
              ),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    new SizedBox(width: 25,),
                    Image.asset(
                      "assets/images/ic_announcement.png",
                      height: 34,
                      width: 34,
                    ),
                    new SizedBox(width: 15,),
                    new Text(
                      "Announcements",
                      style: new TextStyle(
                          fontFamily: 'AvenirNext',
                          fontSize: 14,
                          color: Color(0xff7F7F7F)),
                      textAlign: TextAlign.center,
                    )
                  ]),
              new SizedBox(height: 16,),
              Container(
                height: _width ,
                width: _width - 50,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) => Card(
                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(16.0),),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15.0,15.0,0,0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Title',style: TextStyle(fontFamily: 'AvenirNext',fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold)),
                                  Text('Subject Overline',style: TextStyle(fontFamily: 'AvenirNext',fontSize: 12,color: Colors.black,fontWeight: FontWeight.normal)),
                                  new SizedBox(width: _width-55,height: 15),

                                ],
                              ),
                            ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                Image.asset("assets/images/dummy_image.png",),
                              ],),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,25.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new SizedBox(width: _width-50,height: 15),
                                    Container(width: _width - 65,child: Text('This is sample description for this headline. You can share this announcement with your collegues diirectly.',style: TextStyle(fontFamily: 'AvenirNext',fontSize: 12,color: Colors.black,fontWeight: FontWeight.normal))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void onManageLeavePress(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>ManageLeaves()));
  }
  void onTimesheetPress(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>MyTimesheet()));
  }
}
