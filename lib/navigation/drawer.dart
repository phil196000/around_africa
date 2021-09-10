import 'package:around_africa/customised_widgets/texts/blacktext.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: SafeArea(
          child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.only(top: 30),
        children: [
          ListTile(
            minLeadingWidth: 20,
            leading: Icon(Icons.search),
            title: BlackText(
              text: 'Location',
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            minLeadingWidth: 20,
            leading: Icon(Icons.qr_code),
            title: BlackText(
              text: 'Qrcode',
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            minLeadingWidth: 20,
            leading: Icon(Icons.person),
            title: BlackText(
              text: 'About',
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      )),
    );
  }
}
