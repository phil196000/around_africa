import 'package:around_africa/screens/about/about.dart';
import 'package:around_africa/screens/details/details.dart';
import 'package:around_africa/screens/details/map.dart';
import 'package:around_africa/screens/home/home.dart';
import 'package:around_africa/screens/onboarding/onboarding.dart';
import 'package:around_africa/screens/qrcode/qrcode.dart';
import 'package:around_africa/screens/splash/splash.dart';
import 'package:around_africa/theme/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Around Africa',
      theme: ThemeData(
          iconTheme: IconThemeData(color: CustomColors.white),
          appBarTheme: AppBarTheme(
              backgroundColor: CustomColors.primary,
              iconTheme: IconThemeData(color: CustomColors.white)),
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: CustomColors.primary),
      home: QrCode(),
    );
  }
}
