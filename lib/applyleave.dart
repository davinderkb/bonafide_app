import 'package:bonafide_app/main.dart';
import 'package:bonafide_app/organizationprofile.dart';
import 'package:bonafide_app/util/constants.dart';
import 'package:flutter/material.dart';

class ApplyLeave extends StatelessWidget {
  BuildContext context;
  @override
  Widget build(BuildContext context) {
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
                  height: _height,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: _height/1.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0)
                          ),
                          color: Color(0xffEB5050),
                        ),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                                height:_height/5.2  ,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(8.0,0,8,16),
                                  child: Center(child: Image.asset("assets/images/apply_leaves_icon.png")),
                                )
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: _width - 24,
                                height:_height/2  ,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  color: Color(0xffF7B9B9),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10.0,10,10,0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(6,0,0,6),
                                        child: Text('From Date (dd/mm/yyyy)',textAlign: TextAlign.start,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 14, color: Color(0xff707070)),),
                                      ),
                                      Center(
                                        child: Container(
                                          width: _width-40,
                                          height: 55,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                            color: Color(0xffF4F6F7),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                child: Text('Click to choose ...',textAlign: TextAlign.start,style: TextStyle(fontSize: 14, color: Color(0xff707070)),),
                                              ),
                                              Padding(
                                                  padding: const EdgeInsets.fromLTRB(0,0,8,0),
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    child: Image.asset("assets/images/ic_date.png",color: Color(0xffEB5050),),
                                                  )
                                              ),

                                            ],
                                          ),
                                        ),
                                      ) ,

                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(6,12,0,6),
                                        child: Text('To Date (dd/mm/yyyy)',textAlign: TextAlign.start,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 14, color: Color(0xff707070)),),
                                      ),
                                      Center(
                                        child: Container(
                                          width: _width-40,
                                          height: 55,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                            color: Color(0xffF4F6F7),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                child: Text('Click to choose ...',textAlign: TextAlign.start,style: TextStyle(fontSize: 14, color: Color(0xff707070)),),
                                              ),
                                              Padding(
                                                  padding: const EdgeInsets.fromLTRB(0,0,8,0),
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    child: Image.asset("assets/images/ic_date.png",color: Color(0xffEB5050),),
                                                  )
                                              ),
                                            ],
                                          ),

                                        ),
                                      ) ,
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0,20,0,0),
                                        child: Center(
                                          child: Container(
                                            height:_height/6 +20,
                                            width: _width-40,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                              color: Color(0xffF4F6F7),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text('Write the reason here ...',textAlign: TextAlign.start,style: TextStyle(fontSize: 14, color: Color(0xff707070)),),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: _height/1.2 -35,
                  bottom:90,
                  left: (_width - _width/1.2)/2,
                  child: SizedBox(
                    height: 50,
                    width: _width/1.2,
                    child: FlatButton(
                      child: Text('Apply',textAlign: TextAlign.start,style: TextStyle(fontSize: 14, color: Colors.white),),
                      onPressed: null,
                      disabledColor: Color(0xffEB5050),
                      shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(32.0),side: BorderSide(color: Colors.white)),
                    ),
                  ),
                )
              ],
            )
        ));
  }


}
