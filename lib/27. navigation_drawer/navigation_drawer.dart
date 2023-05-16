import 'package:flutter/material.dart';
import 'account.dart';
import 'settings.dart';

class FlutterNavigationDrawer extends StatefulWidget {
  static const String path = "/navigation-drawer";
  const FlutterNavigationDrawer({super.key});

  @override
  FlutterNavigationDrawerState createState() => FlutterNavigationDrawerState();
}

class FlutterNavigationDrawerState extends State<FlutterNavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Drawer"),
      ),
      body: Center(
        child: Text("Home Screen"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            // DrawerHeader(child: Text("Header")),
            UserAccountsDrawerHeader(
              accountName: Text("Elon Musk"),
              accountEmail: Text("elon@twitter.com"),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.android),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                setState(() {
                  Navigator.of(context).pop();
                });
              },
            ),
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
              onTap: () {
                setState(() {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(SettingsScreen.path);
                });
              },
            ),
            ListTile(
              title: Text("Account"),
              leading: Icon(Icons.account_box),
              onTap: () {
                setState(() {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(AccountScreen.path);
                });
              },
            ),
            AboutListTile(
              applicationName: "Application Name",
              applicationVersion: "v1.0.0",
              applicationIcon: Icon(Icons.adb),
              icon: Icon(Icons.info),
              child: Text("About"),
            ),
          ],
        ),
      ),
    );
  }
}
