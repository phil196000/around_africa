import 'package:around_africa/customised_widgets/texts/blacktext.dart';
import 'package:around_africa/main.dart';
import 'package:around_africa/redux/actions/selectedtab.dart';
import 'package:around_africa/redux/appstate.dart';
import 'package:around_africa/screens/about/about.dart';
import 'package:around_africa/screens/home/home.dart';
import 'package:around_africa/screens/qrcode/qrcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);
  List<NavItems> navItems = [
    NavItems(title: 'Location', icon: Icons.search),
    NavItems(title: 'Qrcode', icon: Icons.qr_code),
    NavItems(title: 'About', icon: Icons.person),
  ];
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      builder: (context, AppState state) {
        return Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: SafeArea(
              child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.only(top: 30),
            children: navItems
                .map(
                  (e) => ListTile(
                    selected: e.title == state.selected,
                    minLeadingWidth: 20,
                    leading: Icon(e.icon),
                    title: BlackText(
                      text: e.title,
                    ),
                    onTap: () {
                      if (e.title != state.selected) {
                        getIt
                            .get<Store<AppState>>()
                            .dispatch(SetSelectedDrawer(selected: e.title));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => e.title == 'Location'
                                  ? Home()
                                  : e.title == "Qrcode"
                                      ? QrCode()
                                      : About(),
                            ));
                      } else {
                        Navigator.pop(context);
                      }
                    },
                  ),
                )
                .toList(),
          )),
        );
      },
      converter: (Store<AppState> store) => store.state,
    );
  }
}

class NavItems {
  final String title;
  final IconData icon;
  NavItems({required this.title, required this.icon});
}
