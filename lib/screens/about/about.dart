import 'dart:developer';
import 'package:around_africa/customised_widgets/texts/blacktext.dart';
import 'package:around_africa/navigation/appbar.dart';
import 'package:around_africa/navigation/drawer.dart';
import 'package:around_africa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:around_africa/navigation/bottomButtons.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      appBar: CustomAppBar(
        context: context,
        onPressed: (BuildContext context) {
          log('Custom App bar pressed');
          Scaffold.of(context).openDrawer();
        },
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Center(
              child: BlackText(
                text: 'AROUND AFRICA',
                size: 35,
                weight: FontWeight.normal,
              ),
            )),
            Expanded(
                flex: 3,
                child: Container(
                  color: CustomColors.ash,
                  child: Center(
                    child: BlackText(text: 'Image'),
                  ),
                )),
            Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Container(
                    child: BlackText(
                      text:
                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.',
                    ),
                  ),
                ))
          ],
        ),
      ),
      persistentFooterButtons: [
        BottomButtons(
          emailPressed: () {},
          phonePressed: () {},
        )
      ],
    );
  }
}
