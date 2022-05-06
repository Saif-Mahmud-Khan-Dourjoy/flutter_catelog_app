// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  final imageUrl =
      "data:image/jpeg;base64,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";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(),
                  margin: EdgeInsets.zero,
                  accountName: Text("Dourjoy Khan"),
                  accountEmail: Text("dourjoykhan@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  )),
            ),
            ListTile(
                leading: Icon(CupertinoIcons.home, color: Colors.white),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 1.2,
                )),
            ListTile(
                leading:
                    Icon(CupertinoIcons.profile_circled, color: Colors.white),
                title: Text(
                  'Profile',
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 1.2,
                )),
            ListTile(
                leading: Icon(CupertinoIcons.mail, color: Colors.white),
                title: Text(
                  'Mail Me',
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 1.2,
                )),
          ],
        ),
      ),
    );
  }
}
