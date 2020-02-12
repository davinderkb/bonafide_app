import 'package:bonafide_app/applyleave.dart';
import 'package:bonafide_app/main.dart';
import 'package:bonafide_app/organizationprofile.dart';
import 'package:bonafide_app/util/constants.dart';
import 'package:flutter/material.dart';

class ManageLeaves extends StatelessWidget {
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
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 15,
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
                                            child: Text("Feb 11, 2020 - Feb 12, 2020",style: TextStyle(color:Color(0xff656D71),fontSize: 14, fontFamily: 'AvenirNext'),),
                                          ),

                                      ],),
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                color: Color(0xff13D178),
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

  void choiceAction(String choice) {
        if(choice == Constants.MENU_ITEM_APPLY_LEAVE){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>ApplyLeave()));
        }
  }
}
