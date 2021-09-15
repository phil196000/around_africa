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
                  child: Image.network(
                    "https://via.placeholder.com/600/372c93",
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                )),
            Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    child: BlackText(
                      text:
                          'AROUND AFRICA is a tourism application which allows users to visit tourist spots across Ghana. In these places, QRCODEs will be made available to allow visitors to have more information on these places.',
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
