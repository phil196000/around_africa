import 'dart:async';
import 'package:around_africa/customised_widgets/texts/around_africa.dart';
import 'package:around_africa/theme/colors.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: SafeArea(
          child: Stack(
        children: [
          Center(
            child: Image.asset('lib/assets/background_image.png'),
          ),
          Center(
            child: WhiteText(
              text: 'AROUND AFRICA',
              size: 40,
              weight: FontWeight.normal,
            ),
          )
        ],
      )),
    );
  }

  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 3000), () {});
  }
}
