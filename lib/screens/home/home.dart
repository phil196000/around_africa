import 'dart:developer';
import 'dart:io';

import 'package:around_africa/customised_widgets/buttons/primarybutton.dart';
import 'package:around_africa/customised_widgets/buttons/textbutton.dart';
import 'package:around_africa/customised_widgets/texts/blacktext.dart';
import 'package:around_africa/data/touristspot.dart';
import 'package:around_africa/main.dart';
import 'package:around_africa/navigation/appbar.dart';
import 'package:around_africa/navigation/drawer.dart';
import 'package:around_africa/redux/actions/itemsaction.dart';
import 'package:around_africa/redux/appstate.dart';
import 'package:around_africa/screens/home/item.dart';
import 'package:around_africa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String search = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: StoreConnector(
        builder: (context, AppState state) {
          List<TouristSpot> spots = state.spots;
          if (search.length > 0) {
            List<TouristSpot> searchResults = [];
            spots.forEach((element) {
              if (element.name!
                  .toLowerCase()
                  .trim()
                  .contains(search.toLowerCase().trim())) {
                searchResults.add(element);
              }
            });
            spots = searchResults;
          }

          return Scaffold(
            drawer: CustomDrawer(),
            appBar: CustomAppBar(
              context: context,
              onPressed: (BuildContext context) {
                Scaffold.of(context).openDrawer();
              },
              onChanged: (String value) {
                setState(() {
                  search = value;
                });
              },
            ),
            body: ListView.builder(
              itemBuilder: (context, index) {
                return Item(
                  key: Key(spots[index].id.toString()),
                  spot: spots[index],
                );
              },
              itemCount: spots.length,
            ),
          );
        },
        converter: (Store<AppState> store) => store.state,
      ),
      onWillPop: () async {
        await showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Close Application')],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7),
                      child: BlackText(
                        text: "You are about to close this App. Proceed?",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonText(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: 'NO',
                          color: Colors.red,
                        ),
                        ButtonText(
                          onPressed: () {
                            exit(0);
                          },
                          text: 'YES',
                          backgroundColor: CustomColors.black,
                          color: CustomColors.white,
                        )
                      ],
                    )
                  ],
                ),
              );
            });
        return false;
      },
    );
  }
}
