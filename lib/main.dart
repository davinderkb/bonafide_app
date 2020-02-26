import 'package:bonafide_app/homepage.dart';
import 'package:bonafide_app/manageleaves.dart';
import 'package:bonafide_app/myrewards.dart';
import 'package:bonafide_app/mytimesheet.dart';
import 'package:bonafide_app/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bonafide_app/organizationprofile.dart';
import 'package:bonafide_app/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

void main() => runApp(MainActivity());

class MainActivity extends StatefulWidget {

  @override
  MainActivityState createState() {



    return MainActivityState();
  }

}


class MainActivityState extends State<MainActivity>{
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  void autoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isLogged = prefs.getBool(Constants.SHARED_PREF_IS_LOGGED_IN);

    if (isLogged) {
      setState(() {
        isLoggedIn = true;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bonafide Technologies',
      theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
      home: isLoggedIn?HomePage():LoginPage(),
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
                onTap: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setBool(Constants.SHARED_PREF_IS_LOGGED_IN, false);
                  prefs.setString(Constants.SHARED_PREF_USER_NAME, null);
                  prefs.setString(Constants.SHARED_PREF_PASSWORD, null);
                  prefs.setString(Constants.SHARED_PREF_NAME, null);
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
