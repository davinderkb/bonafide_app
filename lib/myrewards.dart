import 'dart:ui';

import 'package:bonafide_app/main.dart';
import 'package:bonafide_app/util/constants.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:bonafide_app/util/util.dart';

class MyRewards extends StatelessWidget {
   List<charts.Series> seriesList;
   bool animate;
   int baseSalary = getBaseSalary();
   int fbpAmount = getFbpAmount();
   int bonusAmount = getBonusAmount();
   int fixSalary;
   int totalSalary;
   TextStyle style = TextStyle(fontFamily: 'AvenirNext', fontSize: 14.0, color: Color(0xff696969));
  MyRewards(bool animate){
    fixSalary = getBaseSalary()+getFbpAmount();
    totalSalary = fixSalary+getBonusAmount();
   seriesList = getRewardList();
   this.animate = animate;
  }

  /// Creates a [PieChart] with sample data and no transition.
  factory MyRewards.withSampleData() {
    return new MyRewards(true);
  }


  @override
  Widget build(BuildContext context) {
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
                  "My Rewards",
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
        ),
        drawer: MainNavigationDrawer(),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [

                Container(

                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 8),
                      child: Column(
                        children: <Widget>[
                          Center(
                              child: Image.asset(
                                  "assets/images/ic_rewards.png", height: _height/5.5,),),
                          Container(
                            width: _width,
                            decoration: BoxDecoration(
                              color: Color(0xffEB5050),
                              borderRadius: BorderRadius.all(Radius.circular(16.0)),
                            ),
                            child: Column(
                              children: <Widget>[
                                new Divider(
                                  height: _height / 30,
                                  color: Colors.white,
                                ),
                                new Row(
                                  children: <Widget>[
                                    rowCell("$fixSalary INR", 'Fixed Salary'),
                                    rowCell('$bonusAmount INR','Bonus'),
                                    rowCell('$totalSalary INR', "Total"),
                                    rowCell('0.85', "Comp-Ratio"),
                                  ],
                                ),
                                new Divider(
                                    height: _height / 30,
                                    color: Colors.white),
                              ],


                            ),
                          ),
                        ],
                      )


                    )),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)),
                      color: Colors.white
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                        width: _width,
                        height: _height/1.75,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: new charts.PieChart(seriesList,
                              animate: animate,
                              // Configure the width of the pie slices to 60px. The remaining space in
                              // the chart will be left as a hole in the center.
                              //
                              // [ArcLabelDecorator] will automatically position the label inside the
                              // arc if the label will fit. If the label will not fit, it will draw
                              // outside of the arc with a leader line. Labels can always display
                              // inside or outside using [LabelPosition].
                              //
                              // Text style for inside / outside can be controlled independently by
                              // setting [insideLabelStyleSpec] and [outsideLabelStyleSpec].
                              //
                              // Example configuring different styles for inside/outside:
                              //       new charts.ArcLabelDecorator(
                              //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
                              //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
                              defaultRenderer: new charts.ArcRendererConfig(
                                  arcWidth: 60,
                                  arcRendererDecorators: [new charts.ArcLabelDecorator(

                                  )]),
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
                                desiredMaxRows: 3,
                                // This defines the padding around each legend entry.
                                cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                                // Render the legend entry text with custom styles.
                                entryTextStyle: charts.TextStyleSpec(
                                    color: charts.MaterialPalette.purple.shadeDefault,
                                    fontFamily: 'AvenirNext',
                                    fontSize: 12,

                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                   ] ),
                  ),
                ),

              ]),
        ));

  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<RewardItem, String>> getRewardList() {

    final data = [
      new RewardItem("Baisc Salary", getBaseSalary()),
      new RewardItem("Flexible Benfit Plan",getFbpAmount() ),
      new RewardItem("Performance Bonus", getBonusAmount()),
    ];

    return [
      new charts.Series<RewardItem, String>(
        id: 'Rewards',
        domainFn: (RewardItem reward, _) => reward.component,
        measureFn: (RewardItem sales, _) => sales.amount,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (RewardItem row, _) => '${row.amount}',
      )
    ];
  }

  static int getBaseSalary() {
    return 113121;
  }

  static int getFbpAmount() {
    return 471976;
  }

  static getBonusAmount() {
    return  57988;
  }
}

/// Sample linear data type.
class RewardItem {
  final String component;
  final int amount;

  RewardItem(this.component, this.amount);
}