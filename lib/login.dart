import 'package:bonafide_app/main.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 14.0);

  HomePage() {}

  @override
  Widget build(BuildContext context) {
    final companyTitle = Text(
      'Bonafide Technologies',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20, color: Color(0xffEB5050)),
    );
    final companyTagline = Text(
      'Door to Success',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 14, color: Color(0xffBEC1C2)),
    );
    final userName = TextField(
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(18.0, 20.0, 18.0, 20.0),
          hintText: "Username",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );

    final passwordField = TextField(
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(18.0, 20.0, 18.0, 20.0),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );

    final forgotPassword = Text(
      'Forgot Password?',
      textAlign: TextAlign.right,
      style: TextStyle(fontSize: 12, color: Color(0xff0072FF)),
    );

    final loginButton = Material(
      borderRadius: BorderRadius.circular(10.0),
      color: Color(0xffEB5050),
      child: MaterialButton(
        minWidth: 265,
        padding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
        onPressed: () {},
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(color: Colors.white, fontSize: 14)),
      ),
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 158.0,
              width: 158.0,
              child: Image.asset(
                "assets/images/bonafide-b.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 16.0,
              width: MediaQuery.of(context).size.width,
            ),
            companyTitle,
            SizedBox(height: 2.0),
            companyTagline,
            SizedBox(height: 34.0),
            Container(height: 54, width: 265, child: userName),
            SizedBox(height: 12.0),
            Column(children: [
              Container(height: 54, width: 265, child: passwordField),
              SizedBox(height: 14.0),
              Container( width: 265, child: forgotPassword)
            ]),
            SizedBox(height: 9.0),
            loginButton,
          ],
        ), /* add child content here */
      ),
    );
  }
}
