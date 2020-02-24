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
    TextStyle style = TextStyle(fontFamily: 'AvenirNext', fontSize: 14.0, color: Color(0xff707070));
    final currentPassword = TextField(
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(18.0, 20.0, 18.0, 20.0),
          hintText: "Current Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );
    final newPassword = TextField(
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(18.0, 20.0, 18.0, 20.0),
          hintText: "New Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );
    final confirmNewPassword = TextField(
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(18.0, 20.0, 18.0, 20.0),
          hintText: "Confirm New Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );
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
              height: _height>_width?_height-80:_height+200,
              color: Color(0xffEB5050),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                      height: _height>_width?_height/5: _height/3  ,

                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0,0,8,16),
                        child: Center(child: Image.asset("assets/images/ic_reset_password.png")),
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8,0,0,8),
                    child: Container(
                      height: _height>_width?_height-_height/5-90: _height-_height/3+190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50.0),
                            bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(50.0),
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

                                  Center(
                                    child: Container(
                                      width: _width-72,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        color: Color(0xffF4F6F7),
                                      ),
                                      child: currentPassword,
                                    ),
                                  ) ,

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
                              child: newPassword,
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
                              child: confirmNewPassword,
                            ),
                          ) ,
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
                              shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0),side: BorderSide(color: Color(0xffF4F6F7))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],),
            ),

        ));
  }


}
