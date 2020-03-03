import 'package:bonafide_app/homepage.dart';
import 'package:bonafide_app/main.dart';
import 'package:bonafide_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bonafide_app/util/constants.dart';
import 'package:toast/toast.dart';


class ResetPassword extends StatelessWidget {
  BuildContext context;
  TextEditingController oldPasswordController = new TextEditingController();
  TextEditingController newPasswordController = new TextEditingController();
  TextEditingController confirmNewPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    TextStyle style = TextStyle(fontFamily: 'AvenirNext', fontSize: 14.0, color: Color(0xff707070));
    final currentPassword = TextField(
      style: style,
      controller: oldPasswordController,
      obscureText: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(18.0, 20.0, 18.0, 20.0),
          labelText: "Current Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );
    final newPassword = TextField(
      style: style,
      controller: newPasswordController,
      obscureText: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(18.0, 20.0, 18.0, 20.0),
          labelText: "New Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );
    final confirmNewPassword = TextField(
      style: style,
      controller: confirmNewPasswordController,
      obscureText: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(18.0, 20.0, 18.0, 20.0),
          labelText: "Confirm New Password",
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
                    padding: const EdgeInsets.fromLTRB(8,0,0,0),
                    child: Container(
                      height: _height>_width?_height-_height/5-80: _height-_height/3+190,
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
                              onPressed: (){
                                  if(oldPasswordController.text.length > 0 && newPasswordController.text.length > 0 && confirmNewPasswordController.text.length > 0) {
                                      if(newPasswordController.text == confirmNewPasswordController.text) {
                                        if(newPasswordController.text == oldPasswordController.text)
                                          Toast.show("'Old Password' & 'New Password' are same", context,
                                              textColor: Colors.white,
                                              duration: Toast.LENGTH_LONG,
                                              gravity: Toast.BOTTOM,
                                              backgroundColor: Colors.orange,
                                              backgroundRadius: 16);
                                        else
                                            _resetPassword(context);

                                      }
                                      else
                                        Toast.show("'New Password' & 'Confirm New Password' fields do not match", context,
                                            textColor: Colors.white,
                                            duration: Toast.LENGTH_LONG,
                                            gravity: Toast.BOTTOM,
                                            backgroundColor: Colors.orange,
                                            backgroundRadius: 16);
                                  } else{
                                    Toast.show("Field cannot be empty", context,
                                        textColor: Colors.white,
                                        duration: Toast.LENGTH_SHORT,
                                        gravity: Toast.BOTTOM,
                                        backgroundColor: Color(0xffEB5050),
                                        backgroundRadius: 16);
                                  }
                                },
                              color: Color(0xffEB5050),
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



  Future<void> _resetPassword(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String email = pref.getString(Constants.SHARED_PREF_USER_NAME);
    if(oldPasswordController.text!=pref.getString(Constants.SHARED_PREF_PASSWORD)){
      Toast.show("Enter correct current password", context,
          textColor: Colors.white,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
          backgroundColor: Color(0xffEB5050),
          backgroundRadius: 16);
      return;
    }
    var dio = Dio();
    var resetPasswordUrl = 'http://boostmart.com/apiproject/reset_password.php';
    FormData formData = new FormData.fromMap({
      "email": email.trim(),
      "old_password": oldPasswordController.text,
      "new_password": newPasswordController.text
    });
    dynamic response = await dio.post(resetPasswordUrl, data: formData);
    if (response.toString() == "Update Successful") {
      pref.setString(Constants.SHARED_PREF_PASSWORD, newPasswordController.text);
      Toast.show("Password changed successfully", context,
          textColor: Colors.white,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.BOTTOM,
          backgroundColor: Color(0xffEB5050),
          backgroundRadius: 16);
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    } else {
      Toast.show("Password Reset Failed, Invalid Old Password", context,
          textColor: Colors.white,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
          backgroundColor: Color(0xffEB5050),
          backgroundRadius: 16);
    }
  }}
