import 'package:bonafide_app/main.dart';
import 'package:bonafide_app/organizationprofile.dart';
import 'package:bonafide_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:bonafide_app/manageleaves.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class ApplyLeave extends StatefulWidget {
  @override
  ApplyLeaveState createState() {
    return new ApplyLeaveState();
  }
}

class ApplyLeaveState extends State<ApplyLeave> {
  DateTime fromDate = DateTime.now();
  DateTime toDate ;
  String toDateString = 'Click here to choose ...';
  String fromDateString = 'Click here to choose ...';
  BuildContext context;
  final globalKey = GlobalKey<ScaffoldState>();

  TextEditingController reason = new TextEditingController();
  Future<Null> _selectFromDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: fromDate,
        firstDate: DateTime(fromDate.year),
        lastDate: new DateTime.now().add(new Duration(days: 365)),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: Theme.of(context).copyWith(
              primaryColor: const Color(0xffEB5050),//Head background
              accentColor: const Color(0xffEB5050),//color you want at header
              buttonTheme: ButtonTheme.of(context).copyWith(
                colorScheme: ColorScheme.fromSwatch(accentColor: const Color(0xffEB5050), primarySwatch: Colors.red),
              ),
            ),
            child: child,
          );
        });
    if (picked != null)
      setState(() {
        fromDate = picked;
        fromDateString = new DateFormat("MMM dd, yyyy").format(picked);
        toDate = picked;
        toDateString = new DateFormat("MMM dd, yyyy").format(picked);
      });
  }

  Future<Null> _selectToDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: fromDate,
        firstDate: fromDate,
        lastDate: fromDate.add(new Duration(days: 365)),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: Theme.of(context).copyWith(
              primaryColor: const Color(0xffEB5050),//Head background
              accentColor: const Color(0xffEB5050),//color you want at header
              buttonTheme: ButtonTheme.of(context).copyWith(
                colorScheme: ColorScheme.fromSwatch(accentColor: const Color(0xffEB5050), primarySwatch: Colors.red),
              ),
            ),
            child: child,
          );
        });
    if (picked != null)
      setState(() {
        toDate = picked;
        toDateString = new DateFormat("MMM dd, yyyy").format(picked);
      });
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    TextStyle style = TextStyle(
        fontFamily: 'AvenirNext', fontSize: 14.0, color: Color(0xff707070));
    final reasonForLeave = TextField(
      controller: reason,
      maxLines: _height > _width ? 6 : 1,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(18.0, 20.0, 18.0, 20.0),
          hintText: "Write the reason here ...",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );
    return Scaffold(
        key: globalKey,
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
                  "Apply Leave",
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
            child: Stack(
          overflow: Overflow.visible,
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Container(
              height: _height > _width ? _height : _height / 0.75 + 62,
              child: Column(
                children: <Widget>[
                  Container(
                    height:
                        _height > _width ? _height / 1.2 : _height / 0.75 + 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32.0),
                          bottomRight: Radius.circular(32.0)),
                      color: Color(0xffEB5050),
                    ),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                            height: _height / 5.2,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 16),
                              child: Center(
                                  child: Image.asset(
                                      "assets/images/apply_leaves_icon.png")),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: _width - 24,
                            height: _height > _width ? _height / 2 : _height,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              color: Color(0xffF7B9B9),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10.0, 10, 10, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(6, 0, 0, 6),
                                    child: Text(
                                      'From Date',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Color(0xff707070)),
                                    ),
                                  ),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        _selectFromDate(context);
                                      },
                                      child: Container(
                                        width: _width - 40,
                                        height: 55,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          color: Color(0xffF4F6F7),
                                          border: Border.all(
                                              color: Color(0xff707070)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 0, 0, 0),
                                              child: Text(
                                                "${fromDateString}",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff707070)),
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 8, 0),
                                                child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset(
                                                    "assets/images/ic_date.png",
                                                    color: Color(0xffEB5050),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(6, 12, 0, 6),
                                    child: Text(
                                      'To Date',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Color(0xff707070)),
                                    ),
                                  ),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        _selectToDate(context);
                                      },
                                      child: Container(
                                        width: _width - 40,
                                        height: 55,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          color: Color(0xffF4F6F7),
                                          border: Border.all(
                                              color: Color(0xff707070)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 0, 0, 0),
                                              child: Text(
                                                "${toDateString}",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff707070)),
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 8, 0),
                                                child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset(
                                                    "assets/images/ic_date.png",
                                                    color: Color(0xffEB5050),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: Center(
                                      child: Container(
                                          height: _height > _width
                                              ? _height / 6 + 20
                                              : 60,
                                          width: _width - 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            color: Color(0xffF4F6F7),
                                          ),
                                          child: reasonForLeave),
                                    ),
                                  )
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
            ),
            Positioned(
              top: _height > _width ? _height / 1.2 - 35 : _height / .75 - 12,
              bottom: _height > _width ? 90 : 10,
              left: (_width - _width / 1.2) / 2,
              child: SizedBox(
                height: 50,
                width: _width / 1.2,
                child: FlatButton(
                  child: Text(
                    'Apply',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  onPressed: () {
                    if (fromDateString==('Click here to choose ...')){
                      Toast.show("Please select 'From Date'", context,
                          textColor: Colors.black54,
                          duration: Toast.LENGTH_SHORT,
                          gravity: Toast.BOTTOM,
                          backgroundColor: Colors.white,
                          backgroundRadius: 16);
                    }else {
                      FocusScope.of(context).unfocus();
                      _applyLeave();
                    }
                  },
                  disabledColor: Color(0xffEB5050),
                  color: Color(0xffEB5050),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(32.0),
                      side: BorderSide(
                        color: Colors.white,
                      )),
                ),
              ),
            )
          ],
        )));
  }

  Future<void> _applyLeave() async {
    var dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var manageLeavesUrl = 'http://boostmart.com/apiproject/apply_leave.php';
    FormData formData = new FormData.fromMap({
      "user_id": prefs.getString(Constants.SHARED_PREF_USER_ID),
      "reason": reason.text,
      "from_date": new DateFormat("yyyy-MM-dd").format(fromDate),
      "to_date": new DateFormat("yyyy-MM-dd").format(toDate)
    });
    dynamic response = await dio.post(manageLeavesUrl, data: formData);
    if (response.toString() == "New record created successfully") {
      Toast.show("Leave applied successfully", context,
          textColor: Colors.white,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.BOTTOM,
          backgroundColor: Color(0xffEB5050),
          backgroundRadius: 16);
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ManageLeaves()));
    }
    else {
      Toast.show(response.toString(), context,
          textColor: Colors.white,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.BOTTOM,
          backgroundColor: Color(0xffEB5050),
          backgroundRadius: 16);
    }
  }
}
