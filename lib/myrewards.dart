import 'package:bonafide_app/main.dart';
import 'package:bonafide_app/util/constants.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class MyRewards extends StatelessWidget {
   List<charts.Series> seriesList;
   bool animate;
   int baseSalary = getBaseSalary();
   int fbpAmount = getFbpAmount();
   int bonusAmount = getBonusAmount();
   int fixSalary;
   int totalSalary;
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
    return Scaffold(
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
                SizedBox(
                  width:MediaQuery
                      .of(context)
                      .size
                      .width ,
                  height: 1.0,
                  child: Container(color: Color(0xffEB5050),),
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
                              Container(color: Color(0xffEB5050),width: 32,height: 64,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[

                                    new Icon(
                                      Icons.card_giftcard, color: Color(0xffEB5050), size: 48,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text("Compensation",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffEB5050))),
                                    ),

                                  ],
                                ),
                              ),
                            ]),
                      ]),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),

                      child:  new RichText(
                        text: new TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          children: <TextSpan>[
                            new TextSpan(text: 'Your CTC components\n\nFixed Salary: '),
                            new TextSpan(text: '$fixSalary INR\n', style: new TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
                            new TextSpan(text: 'Performance Bonus:'),
                            new TextSpan(text: '$bonusAmount INR\n', style: new TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
                            new TextSpan(text: 'Total:'),
                            new TextSpan(text: ' $totalSalary INR', style: new TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
                            new TextSpan(text: '\nComp-Ratio: '),
                            new TextSpan(text: ' 0.85', style: new TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),

                    ),
                      SizedBox(
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
                                arcRendererDecorators: [new charts.ArcLabelDecorator()]),
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
                                  fontFamily: 'Georgia',
                                  fontSize: 11),
                            )
                          ],
                        ),
                      ),
                    ),
                 ] ),
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