import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:bonafide_app/organizationprofile.dart';
import 'package:bonafide_app/util/constants.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(),
      drawer: MainNavigationDrawer(),
    );
  }
}

class MainNavigationDrawer extends StatelessWidget {
  const MainNavigationDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Kamaldeep'),
            accountEmail: Text('kamal8iweb@gmail.com'),
            currentAccountPicture:
            Image.asset('assets/images/ic_profile.png'),
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          ListTile(
            title: Text(Constants.MY_TIMESHEET),
            leading: Icon(Icons.calendar_today),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>HomePage()));
            },
          ),
          ListTile(
            title: Text(Constants.ORGANIZATION_PROFILE),
            leading: Icon(Icons.business),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>OrganizationProfile()));
            },
          ),
        ],
      ),
    );
  }
}
