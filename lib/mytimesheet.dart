import 'package:bonafide_app/util/constants.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:bonafide_app/main.dart';


class MyTimesheet extends StatelessWidget {
  List<charts.Series> timesheetEntriesList;
  bool animate;

  MyTimesheet(bool animate) {
    this.timesheetEntriesList = _getTimesheetEntries();
    this.animate = animate;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          iconTheme: new IconThemeData(color: Color(0xffab110c)),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/bonafide-b.png',
                  fit: BoxFit.contain,
                  height: 48,
                )
              ]),
          centerTitle: true,

          elevation: 0.0,
          backgroundColor: Colors.blue[50],
        ),
        drawer: MainNavigationDrawer(),
        body: SingleChildScrollView(

          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width:MediaQuery
                      .of(context)
                      .size
                      .width ,
                  height: 1.0,
                  child: Container(color: Colors.indigoAccent,),
                ),
                SizedBox(
                  width:MediaQuery
                      .of(context)
                      .size
                      .width ,
                  height: 4.0,

                ),
                Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                            children: [
                              Container(color: Colors.indigoAccent,width: 32,height: 48,),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image(image: AssetImage(
                                          "assets/images/date_icon.png"),
                                        height: 48,
                                        width: 48,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text(" Jan 10, 2020 to \n Jan 16, 2020",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                color: Colors.indigo)),
                                      ),

                                    ],
                                  ),
                                ),
                            ]),
                      ]),
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 3,
                    child: Padding(
                      padding: EdgeInsets.only(left:10.0,right: 10.0),
                      child: new charts.BarChart(
                        timesheetEntriesList,
                        animate: animate,
                        vertical: true,
                        domainAxis: new charts.OrdinalAxisSpec(
                            renderSpec: new charts.SmallTickRendererSpec(

                              // Tick and Label styling here.
                                labelStyle: new charts.TextStyleSpec(
                                    fontSize: 12, // size in Pts.
                                    color: charts.MaterialPalette.black),

                                // Change the line colors to match text color.
                                lineStyle: new charts.LineStyleSpec(
                                    color: charts.MaterialPalette.white))),
                        primaryMeasureAxis: new charts.NumericAxisSpec(
                            renderSpec: new charts.GridlineRendererSpec(

                              // Tick and Label styling here.
                                labelStyle: new charts.TextStyleSpec(
                                    fontSize: 12, // size in Pts.
                                    color: charts.MaterialPalette.black),

                                // Change the line colors to match text color.
                                lineStyle: new charts.LineStyleSpec(
                                    color: charts.MaterialPalette.black))),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left:45.0,top: 15.0, right: 45.0, bottom: 0.0),
                    child: new FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.indigoAccent,
                      onPressed: () {},
                      child: new Container(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center,
                          children: <Widget>[
                            new Icon(
                              Icons.timelapse, color: Colors.white,),

                            Padding(
                              padding: const EdgeInsets.only(left:8.0, top: 5.0, bottom: 5.0),
                              child: new Text(
                                Constants.LOG_MISSING_HOURS, style: TextStyle(
                                  color: Colors.blue[50]),),
                            )
                          ],
                        ),
                      ),

                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left:45.0,top: 0.0, right: 45.0, bottom: 0.0),
                    child: new FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.indigoAccent,
                      onPressed: () {},
                      child: new Container(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center,
                          children: <Widget>[
                            new Icon(
                              Icons.history, color: Colors.white,),

                            Padding(
                              padding: const EdgeInsets.only(left:8.0, top: 5.0, bottom: 5.0),
                              child: new Text(
                                Constants.CHECK_HISTORY, style: TextStyle(
                                  color: Colors.blue[50]),),
                            )
                          ],
                        ),
                      ),

                    ),
                  ),
                ),
              ]),
        ));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimesheetEntry, String>> _getTimesheetEntries() {
    final red = charts.MaterialPalette.red.makeShades(1);
    final green = charts.MaterialPalette.green.makeShades(1);
    final data = [
      new TimesheetEntry('Mon', 8.0),
      new TimesheetEntry('Tue', 7.0),
      new TimesheetEntry('Wed', 6.15),
      new TimesheetEntry('Thu', 4.5),
      new TimesheetEntry('Fri', 8),
      new TimesheetEntry('Sat', 7.7),
      new TimesheetEntry('Sun', 2),
    ];

    return [
      new charts.Series<TimesheetEntry, String>(
          id: 'Billing Hours',
          domainFn: (TimesheetEntry sales, _) => sales.day,
          measureFn: (TimesheetEntry sales, _) => sales.hours,
          data: data,
          colorFn: (TimesheetEntry entry, _) {
            switch (entry.hours >= 8.0) {
              case true:
                {
                  return green[1];
                }
              case false:
                {
                  return red[1];
                }
              default:
                {
                  return red[0];
                }
            }
          }
      )
    ];
  }
}

/// Sample ordinal data type.
class TimesheetEntry {
  final String day;
  final double hours;

  TimesheetEntry(this.day, this.hours);
}