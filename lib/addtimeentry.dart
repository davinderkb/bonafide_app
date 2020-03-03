
import 'package:bonafide_app/updatetimesheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bonafide_app/timesheet_entry.dart';
import 'package:toast/toast.dart';

String defaultDateString = 'Click to select date ..';
String defaultDurationString = 'Click to set duration ..';

class AddTimesheetEntry extends StatefulWidget {
  UpdateTimesheet _updateTimeSheetObj;
  AddTimesheetEntry(this._updateTimeSheetObj);

  @override
  AddTimesheetEntryState createState() {
    return new AddTimesheetEntryState();
  }
}

class AddTimesheetEntryState extends State<AddTimesheetEntry> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedDuration = TimeOfDay.now();
  String selectedDateString = defaultDateString;
  String selectedDurationString = defaultDurationString;
  BuildContext context;

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 8, minute: 0),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: Theme.of(context).copyWith(
            primaryColor: const Color(0xffEB5050), //Head background
            accentColor: const Color(0xffEB5050), //color you want at header
            buttonTheme: ButtonTheme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch(
                  accentColor: const Color(0xffEB5050),
                  primarySwatch: Colors.red),
            ),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child,
          ),
        );
      },
    );
    if (picked != null) {
      setState(() {
        selectedDuration = picked;
        selectedDurationString = selectedDuration.toString().substring(
            selectedDuration.toString().indexOf("(") + 1,
            selectedDuration.toString().indexOf(")"));
      });
    }
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(selectedDate.year),
        lastDate: new DateTime.now().add(new Duration(days: 0)),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: Theme.of(context).copyWith(
              primaryColor: const Color(0xffEB5050), //Head background
              accentColor: const Color(0xffEB5050), //color you want at header
              buttonTheme: ButtonTheme.of(context).copyWith(
                colorScheme: ColorScheme.fromSwatch(
                    accentColor: const Color(0xffEB5050),
                    primarySwatch: Colors.red),
              ),
            ),
            child: child,
          );
        });

    if (picked != null)
      setState(() {
        selectedDate = picked;
        selectedDateString = new DateFormat("MMM dd, yyyy").format(picked);
      });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
        fontFamily: 'AvenirNext', fontSize: 14.0, color: Color(0xff707070));
    final timeHours = TextField(
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(18.0, 20.0, 18.0, 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );
    this.context = context;
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                new Text(
                  "Add Entry",
                  style: new TextStyle(
                      fontFamily: 'AvenirNext',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFFFFF)),
                  textAlign: TextAlign.center,
                ),
              ]),
          centerTitle: false,
          elevation: 0.0,
          backgroundColor: Color(0xffEB5050),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              height: _height / 4.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(60.0)),
                color: Color(0xffEB5050),
              ),
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
                                "assets/images/clipart_add_entry.png")),
                      )),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 60, 12, 12),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      width: _width - 72,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFEB5050)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                            child: Text(
                              selectedDateString,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: "AvenirNext",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Icon(
                                  Icons.calendar_today,
                                  color: Color(0xFFEB5050),
                                  size: 32,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                ),
                Center(
                  /*child: Container(
                        width: _width-72,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Color(0xffF4F6F7),
                        ),
                        child: timeHours,
                      ),*/
                  child: GestureDetector(
                    onTap: () {
                      _selectTime(context);
                    },
                    child: Container(
                      width: _width - 72,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFEB5050)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                            child: Text(
                              selectedDurationString,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: "AvenirNext",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Icon(
                                  Icons.timelapse,
                                  color: Color(0xFFEB5050),
                                  size: 32,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
            ),
            SizedBox(
              height: 60,
              width: _width - 72,
              child: FlatButton.icon(
                label: Text(
                  'Save',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                icon: Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (selectedDateString == defaultDateString) {
                    Toast.show("Kindly select date first", context,
                        textColor: Colors.white,
                        duration: Toast.LENGTH_SHORT,
                        gravity: Toast.BOTTOM,
                        backgroundColor: Colors.blue,
                        backgroundRadius: 16);
                  } else if (selectedDurationString == defaultDurationString) {
                    Toast.show("Please set duration", context,
                        textColor: Colors.white,
                        duration: Toast.LENGTH_SHORT,
                        gravity: Toast.BOTTOM,
                        backgroundColor: Colors.blue,
                        backgroundRadius: 16);
                      } else {
                              bool isRepeated = false;
                              for (var i = 0; i < widget._updateTimeSheetObj.getTimesheetEntries().length; i++) {
                                  if(widget._updateTimeSheetObj.getTimesheetEntries()[i].date == selectedDateString){
                                    Toast.show("Entry for this date already saved", context,
                                        textColor: Colors.white,
                                        duration: Toast.LENGTH_SHORT,
                                        gravity: Toast.BOTTOM,
                                        backgroundColor: Colors.blue,
                                        backgroundRadius: 16);
                                    isRepeated = true;
                                    break;
                                  }
                              }
                              if(!isRepeated) {
                                addEntryToTimesheetList(new TimesheetEntry(
                                    selectedDateString,
                                    selectedDurationString, false));
                              }
                            }
                },
                disabledColor: Color(0xffEB5050),
                color: Color(0xffEB5050),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.white)),
              ),
            )
          ],
        )));
  }

  void addEntryToTimesheetList(TimesheetEntry entry) {
    widget._updateTimeSheetObj.addRow(entry);
    Navigator.pop(context);
  }
}
