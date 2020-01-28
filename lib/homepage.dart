import 'package:bonafide_app/main.dart';
import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {

  HomePage() {

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
    drawer: MainNavigationDrawer());
  }



}