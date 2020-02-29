import 'package:bonafide_app/addtimeentry.dart';
import 'package:bonafide_app/applyleave.dart';
import 'package:bonafide_app/edittimeentry.dart';
import 'package:bonafide_app/main.dart';
import 'package:bonafide_app/organizationprofile.dart';
import 'package:bonafide_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:bonafide_app/timesheet_entry.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final _timeSheetEntries = new List<TimesheetEntry>();
class UpdateTimesheet extends StatefulWidget {



  var updateTimesheetState = new UpdateTimesheetState();
  @override
  UpdateTimesheetState createState() {
    return updateTimesheetState;
  }



  void addRow(TimesheetEntry entry) {
    updateTimesheetState._addTimesheetList(entry);
  }
  void deleteRow(int index) {
    updateTimesheetState._deleteRowTimesheetList(index);
  }

  List<TimesheetEntry> getTimesheetEntries() {
    return _timeSheetEntries;
  }

  void updateRow(TimesheetEntry entry, int index) {
    updateTimesheetState._updateRowTimesheetList(entry, index);
  }
}

class UpdateTimesheetState extends State<UpdateTimesheet>{
  BuildContext context;
  Future<List<TimesheetEntry>> futureTimesheetEntries;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureTimesheetEntries = fetchSheetEntries();
  }
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
                  Center(
                    child: Container(
                      height: 48,
                      width: 48,
                      child: RaisedButton(
                          disabledColor:Color(0xffEB5050) ,
                          color: Color(0xffEB5050) ,

                          elevation: 1.0,
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>AddTimesheetEntry(this.widget)));
                          },
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
                            FutureBuilder(
                              future: futureTimesheetEntries,
                              builder: (context, snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.none:
                                  case ConnectionState.waiting:
                                  case ConnectionState.active:
                                    return Center(
                                      child: Container(
                                        height: _height-200,
                                        alignment: Alignment.center,
                                        child: SpinKitCircle(
                                          color: Color(0xFFEB5050),
                                          size: 50.0,
                                        ),
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
                                    return  Expanded(
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: data.length,
                                        itemBuilder:
                                            (BuildContext context, int index) => Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            InkWell(
                                              onTap: (){
                                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>EditTimesheetEntry(this.widget, data[index], index)));
                                              },
                                              child: Card(
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
                                                              child:Icon(Icons.calendar_today, color: Colors.blue,size: 16,)),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets.fromLTRB(
                                                                10, 0, 0, 0),
                                                            child: Text(
                                                              data[index].date,
                                                              style: TextStyle(
                                                                  fontFamily: "AvenirNext",
                                                                  fontSize: 15,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.blue),
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
                                                              child: Icon(Icons.timelapse, color: Colors.blue,size: 16,)),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets.fromLTRB(
                                                                10, 0, 0, 0),
                                                            child: Text(
                                                              data[index].duration,
                                                              style: TextStyle(
                                                                  fontFamily: "AvenirNext",
                                                                  fontSize: 15,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.blue),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: (){
                                                  widget.deleteRow(index);
                                              },
                                              child: Card(
                                                child: Container(
                                                  height: _width / 7.5,
                                                  width: _width / 7.5,
                                                  child: Center(
                                                    child: Container(
                                                      height: 22,
                                                      width: 22,
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
                                    );
                                    break;
                                }
                              },
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

   _addTimesheetList(TimesheetEntry entry) {
    _timeSheetEntries.add(entry);
      setState(() {
        futureTimesheetEntries = fetchSheetEntries();
      });

  }

  _deleteRowTimesheetList(int index) {
    _timeSheetEntries.removeAt(index);
    setState(() {
      futureTimesheetEntries = fetchSheetEntries();
    });

  }
  _updateRowTimesheetList(TimesheetEntry entry, int index) {
    _timeSheetEntries[index] = entry;
    setState(() {
      futureTimesheetEntries = fetchSheetEntries();
    });

  }

  Future<List<TimesheetEntry>>fetchSheetEntries() async {
    return _timeSheetEntries;
  }
}