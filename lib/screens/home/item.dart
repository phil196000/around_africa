import 'package:around_africa/customised_widgets/texts/blacktext.dart';
import 'package:around_africa/theme/colors.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 70,
              height: 100,
              color: CustomColors.primary,
            ),
            title: BlackText(
              text: 'Title 1',
            ),
            subtitle: BlackText(
              weight: FontWeight.normal,
              text: 'Lorem Ipsum is simply',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Divider(
              thickness: 2,
            ),
          )
        ],
      ),
    );
  }
}
