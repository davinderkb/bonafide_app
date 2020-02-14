import 'package:bonafide_app/main.dart';
import 'package:bonafide_app/organizationprofile.dart';
import 'package:bonafide_app/util/constants.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                new Text(
                  "Reset Password",
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

            child:   Container(
              height: _height-80,
              color: Color(0xffEB5050),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                      height:_height/5  ,

                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0,0,8,16),
                        child: Center(child: Image.asset("assets/images/ic_reset_password.png")),
                      )
                  ),
                  Container(
                    height: _height-_height/5-80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(80.0),
                          bottomRight: Radius.circular(80.0),
                        topLeft: Radius.circular(80.0),
                        topRight: Radius.circular(0.0),

                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12,48,12,12),
                        ),
                        Center(
                          child: Container(
                            width: _width-72,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              color: Color(0xffF4F6F7),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(12,0,0,0),
                                  child: Text('Current Password',textAlign: TextAlign.start,style: TextStyle(fontSize: 14, color: Color(0xff707070)),),
                                ),

                              ],
                            ),
                          ),
                        ) ,

                        Padding(
                          padding: const EdgeInsets.all(12),
                        ),
                        Center(
                          child: Container(
                            width: _width-72,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              color: Color(0xffF4F6F7),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(12,0,0,0),
                                  child: Text('New Password',textAlign: TextAlign.start,style: TextStyle(fontSize: 14, color: Color(0xff707070)),),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                        ),
                        Center(
                          child: Container(
                            width: _width-72,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              color: Color(0xffF4F6F7),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(12,0,0,0),
                                  child: Text('Confirm New Password',textAlign: TextAlign.start,style: TextStyle(fontSize: 14, color: Color(0xff707070)),),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                        ),
                        SizedBox(
                          height: 60,
                          width: _width-72,
                          child: FlatButton.icon(
                            label: Text('Reset Password',textAlign: TextAlign.start,style: TextStyle(fontSize: 14, color: Colors.white),),
                            icon: Icon(
                              Icons.threesixty,
                              color: Colors.white,
                            ),
                            onPressed: null,
                            disabledColor: Color(0xffEB5050),
                            shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0),side: BorderSide(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],),
            ),

        ));
  }


}
