import 'package:bonafide_app/main.dart';
import 'package:bonafide_app/util/constants.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class MyRewards extends StatelessWidget {
   List<charts.Series> seriesList;
   bool animate;

  MyRewards(bool animate){
   seriesList = getRewardList();
   this.animate = animate;
  }

  /// Creates a [PieChart] with sample data and no transition.
  factory MyRewards.withSampleData() {
    return new MyRewards(true);
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Image(image: AssetImage(
                                        ""),
                                      height: 48,
                                      width: 0,),
                                    new Icon(
                                      Icons.history, color: Colors.white,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0.0),
                                      child: Text("Compensation",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
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
                        .height / 2,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: new charts.PieChart(
                        seriesList,
                        animate: animate,
                        // Add the legend behavior to the chart to turn on legends.
                        // This example shows how to change the position and justification of
                        // the legend, in addition to altering the max rows and padding.
                        behaviors: [
                          new charts.DatumLegend(
                            // Positions for "start" and "end" will be left and right respectively
                            // for widgets with a build context that has directionality ltr.
                            // For rtl, "start" and "end" will be right and left respectively.
                            // Since this example has directionality of ltr, the legend is
                            // positioned on the right side of the chart.
                            position: charts.BehaviorPosition.bottom,
                            // For a legend that is positioned on the left or right of the chart,
                            // setting the justification for [endDrawArea] is aligned to the
                            // bottom of the chart draw area.
                            outsideJustification: charts.OutsideJustification.endDrawArea,
                            // By default, if the position of the chart is on the left or right of
                            // the chart, [horizontalFirst] is set to false. This means that the
                            // legend entries will grow as new rows first instead of a new column.
                            horizontalFirst: false,
                            // By setting this value to 2, the legend entries will grow up to two
                            // rows before adding a new column.
                            desiredMaxRows: 4,
                            // This defines the padding around each legend entry.
                            cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                            // Render the legend entry text with custom styles.
                            entryTextStyle: charts.TextStyleSpec(
                                color: charts.MaterialPalette.purple.shadeDefault,
                                fontFamily: 'Georgia',
                                fontSize: 11),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

              ]),
        ));

  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<RewardItem, String>> getRewardList() {
    final data = [
      new RewardItem("Baisc Salary", 113121),
      new RewardItem("Flexible Benfit Plan",471976 ),
      new RewardItem("Performance Bonus", 57988),
    ];

    return [
      new charts.Series<RewardItem, String>(
        id: 'Rewards',
        domainFn: (RewardItem reward, _) => reward.component,
        measureFn: (RewardItem sales, _) => sales.amount,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (RewardItem row, _) => '${row.amount}INR',
      )
    ];
  }
}

/// Sample linear data type.
class RewardItem {
  final String component;
  final int amount;

  RewardItem(this.component, this.amount);
}