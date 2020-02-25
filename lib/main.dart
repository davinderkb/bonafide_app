import 'package:bonafide_app/homepage.dart';
import 'package:bonafide_app/manageleaves.dart';
import 'package:bonafide_app/myrewards.dart';
import 'package:bonafide_app/mytimesheet.dart';
import 'package:bonafide_app/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bonafide_app/organizationprofile.dart';
import 'package:bonafide_app/util/constants.dart';

import 'login.dart';

void main() => runApp(MainActivity());

class MainActivity extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bonafide Technologies',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}


class MainNavigationDrawer extends StatelessWidget {
  const MainNavigationDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextStyle listTileTextStyle = TextStyle(color:Colors.white,fontSize: 15, fontWeight:FontWeight.bold,fontFamily: 'AvenirNext');
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.orangeAccent, //This will change the drawer background to blue.
        //other styles
      ),
      child: new Drawer(
        child: ListTileTheme(

          textColor: Color(0xff0072FF),
          iconColor:  Color(0xff0072FF),
          dense:true,


          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Naresh Kumar',style: TextStyle(color:Color(0xffFFFFFF),fontSize: 18, fontWeight:FontWeight.bold, fontFamily: 'AvenirNext')),
                accountEmail: Text('naresh@bonafidetech.com',style: TextStyle(color:Color(0xffFFFFFF),fontSize: 14, fontFamily: 'AvenirNext')),
                decoration: BoxDecoration(color: Color(0xffEB5050), ),

              ),
              ListTile(
                title: Text(Constants.HOME,style: listTileTextStyle,),
                leading: Icon(Icons.home,color:Colors.white),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>HomePage()));
                },
              ),
              //new Divider(height: 1.0, color: Colors.white,),
              ListTile(
                title: Text(Constants.MY_REWARDS,style: listTileTextStyle,),
                leading: Icon(Icons.card_giftcard,color:Colors.white),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>MyRewards(true)));
                },
              ),

              ListTile(
                title: Text(Constants.ORGANIZATION_PROFILE,style:listTileTextStyle,),
                leading: Icon(Icons.business,color:Colors.white),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>OrganizationProfile()));
                },
              ),
              ListTile(
                title: Text(Constants.CHANGE_PASSWORD,style: listTileTextStyle,),
                leading: Icon(Icons.settings,color:Colors.white),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>ResetPassword()));
                },
              ),
              ListTile(
                title: Text(Constants.LOGOUT,style: listTileTextStyle,),
                leading: Icon(Icons.launch,color:Colors.white),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>LoginPage()));
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
