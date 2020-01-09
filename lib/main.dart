import 'package:bonafide_app/manageleaves.dart';
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
      appBar: new AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
          Image.asset(
          'assets/images/bonafide_logo.png',
          fit: BoxFit.contain,
          height: 48,
        )]),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.black,
      ),
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

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.black, //This will change the drawer background to blue.
        //other styles
      ),
      child: new Drawer(
        child: ListTileTheme(

          textColor: Colors.white,
          iconColor: Colors.white,



          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Naresh Kumar',style: TextStyle(fontWeight: FontWeight.bold)),
                accountEmail: Text('nakumar@bonafide.com',style: TextStyle(fontWeight: FontWeight.bold)),
                currentAccountPicture:
                Image.asset('assets/images/ic_profile.png'),
                decoration: BoxDecoration(color: Color(0xffab110c)),
              ),
              Column(
                children: [ListTile(
                  title: Text(Constants.MY_TIMESHEET,style: TextStyle(fontWeight: FontWeight.w500),),
                  leading: Icon(Icons.calendar_today),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>HomePage()));
                  },
                ),
                new Divider(height: 1.0, color: Colors.white,)]
              ),
              ListTile(
                title: Text(Constants.MY_REWARDS,style: TextStyle(fontWeight: FontWeight.w500),),
                leading: Icon(Icons.card_giftcard),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>OrganizationProfile()));
                },
              ),
              ListTile(
                title: Text(Constants.MANAGE_LEAVES,style: TextStyle(fontWeight: FontWeight.w500),),
                leading: Icon(Icons.calendar_view_day),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>ManageLeaves()));
                },
              ),
              Column(
                children: [ListTile(
                  title: Text(Constants.ORGANIZATION_PROFILE,style: TextStyle(fontWeight: FontWeight.w500),),
                  leading: Icon(Icons.business),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>OrganizationProfile()));
                  },
                ),
                new Divider(height: 1.0,color: Colors.white,)]
              ),
              ListTile(
                title: Text(Constants.CHANGE_PASSWORD,style: TextStyle(fontWeight: FontWeight.w500),),
                leading: Icon(Icons.settings),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>OrganizationProfile()));
                },
              ),
              Column(
                children: [ListTile(
                  title: Text(Constants.LOGOUT,style: TextStyle(fontWeight: FontWeight.w500),),
                  leading: Icon(Icons.launch),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>OrganizationProfile()));
                  },
                ),
                new Divider(height: 1.0,color: Colors.white,)]
              ),

            ],
          ),
        ),
      ),
    );
  }
}
