import 'dart:convert';
import 'dart:ui';

import 'package:bonafide_app/main.dart';
import 'package:bonafide_app/userdata.dart';
import 'package:bonafide_app/util/constants.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:bonafide_app/util/util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class MyRewards extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyRewardsState();
  }

}

class MyRewardsState extends State<MyRewards> {
  dynamic userData;
  bool animate;
  TextStyle style = TextStyle(
      fontFamily: 'AvenirNext', fontSize: 14.0, color: Color(0xff696969));

  RefreshController _refreshControllerOnErrorReload = RefreshController(initialRefresh: false);

  /// Creates a [PieChart] with sample data and no transition.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userData = _getRewardDetails(context);
  }


  Future<UserData> _getRewardDetails(BuildContext context) async {
    var dio = Dio();
    var loginUrl = 'http://boostmart.com/apiproject/login.php';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FormData formData = new FormData.fromMap({
      "email":prefs.getString(Constants.SHARED_PREF_USER_NAME),
      "password":prefs.getString(Constants.SHARED_PREF_PASSWORD)
    });
    dynamic response = await dio.post(loginUrl, data: formData);
    dynamic responseList = jsonDecode(response.toString());
    if (responseList["data"]!=null) {
      return UserData.fromJson(responseList["data"]);
    } else {
      Toast.show("Not able to fetch reward details, Try again", context, textColor: Colors.white,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM,backgroundColor: Color(0xffEB5050),backgroundRadius: 16);
    }
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
          child: FutureBuilder(
            future: userData,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return Container(
                    height: _height-120,
                    alignment: Alignment.center,
                    child: SpinKitHourGlass(
                      color: Color(0xffFFFFFF),
                      size: 50.0,
                    ),
                  );
                  break;
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    // return whatever you'd do for this case, probably an error
                    return SingleChildScrollView(
                      child: Container(
                        height: _height,
                        width: _width,
                        color: Colors.white,
                        child: SmartRefresher(
                          child: Container(
                            height:_height>_width?_height:_width,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topCenter,
                                  width: _width,
                                  child: Image.asset("assets/images/no_internet.png",fit: BoxFit.fill,),
                                ),

                                Image.asset("assets/images/pulldown_refresh.png", height: 32,color: Colors.blue,),
                                SizedBox(height: 8,),
                                Text("Pull Down To Refresh", style: TextStyle(fontFamily: 'AvenirNext',fontSize: 13,color: Colors.blue,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),

                          controller: _refreshControllerOnErrorReload,
                          onRefresh: ()async{
                            var connectivityResult = await (Connectivity().checkConnectivity());
                            if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) =>MyRewards()));
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
                        ),
                      ),
                    );
                  }
                  UserData data = snapshot.data as UserData;
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 0, 8, 8),
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Image.asset(
                                        "assets/images/ic_rewards.png",
                                        height: _height / 5.5,
                                      ),
                                    ),
                                    Container(
                                      width: _width,
                                      decoration: BoxDecoration(
                                        color: Color(0xffEB5050),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16.0)),
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          new Divider(
                                            height: _height / 30,
                                            color: Colors.white,
                                          ),
                                          new Row(
                                            children: <Widget>[
                                              rowCell(data.fixSalary+" INR",
                                                  'Fixed Salary'),
                                              rowCell(
                                                  data.bonus+' INR', 'Bonus'),
                                              rowCell(
                                                  data.totalSalary +' INR', "Total"),
                                              rowCell(data.compRate, "Comp-Ratio"),
                                            ],
                                          ),
                                          new Divider(
                                              height: _height / 30,
                                              color: Colors.white),
                                        ],
                                      ),
                                    ),
                                  ],
                                ))),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0)),
                              color: Colors.white),
                          child: Center(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: _width,
                                    height: _height / 1.75,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: new charts.PieChart(
                                        getRewardList(data.fixSalary, data.bonus, data.basicSalary),
                                        animate: animate,

                                        defaultRenderer:
                                            new charts.ArcRendererConfig(
                                                arcWidth: 70,
                                                arcRendererDecorators: [
                                              new charts.ArcLabelDecorator()
                                            ]),
                                        behaviors: [
                                          new charts.DatumLegend(
                                            position:charts.BehaviorPosition.bottom,
                                            outsideJustification: charts.OutsideJustification.endDrawArea,
                                            horizontalFirst: false,
                                            desiredMaxRows: 3,
                                            cellPadding: new EdgeInsets.only(
                                                right: 4.0, bottom: 4.0),
                                            entryTextStyle:
                                                charts.TextStyleSpec(
                                              color: charts.MaterialPalette
                                                  .purple.shadeDefault,
                                              fontFamily: 'AvenirNext',
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ]);
                  break;
              }
            },
          ),
        ));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<RewardItem, String>> getRewardList(String fixSalary, String bonus, String basicSalary ) {
    final data = [
      new RewardItem("Baisc Salary",int.parse(basicSalary)),
      new RewardItem("Flexible Benfit Plan", int.parse(fixSalary)),
      new RewardItem("Performance Bonus", int.parse(bonus)),
    ];

    return [
      new charts.Series<RewardItem, String>(
        id: 'Rewards',
        domainFn: (RewardItem reward, _) => reward.component,
        measureFn: (RewardItem sales, _) => sales.amount,
        //colorFn: (_, __) => charts.MaterialPalette.lime.shadeDefault,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (RewardItem row, _) => '${row.amount}',
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
