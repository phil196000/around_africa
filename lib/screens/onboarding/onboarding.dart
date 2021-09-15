import 'dart:io';

import 'package:around_africa/customised_widgets/buttons/primarybutton.dart';
import 'package:around_africa/customised_widgets/buttons/textbutton.dart';
import 'package:around_africa/customised_widgets/texts/blacktext.dart';
import 'package:around_africa/customised_widgets/texts/whitetext.dart';
import 'package:around_africa/screens/home/home.dart';
import 'package:around_africa/theme/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  CarouselController _carouselController = CarouselController();
  List<OnboardingItems> onboarding = [
    OnboardingItems(
      image: 'lib/assets/onboarding/running.png',
      message:
          "Touring AFRICA and learning about it's beautiful historical destinations just got easier",
    ),
    OnboardingItems(
      image: 'lib/assets/onboarding/running.png',
      message:
          "Touring AFRICA and learning about it's beautiful historical destinations just got easier",
    ),
    OnboardingItems(
      image: 'lib/assets/onboarding/running.png',
      message:
          "Touring AFRICA and learning about it's beautiful historical destinations just got easier",
    ),
  ];
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: SafeArea(
            child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                // width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'lib/assets/background_image.png',
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: Center(
                        child: WhiteText(
                          text: 'AROUND AFRICA',
                          size: 40,
                          weight: FontWeight.normal,
                        ),
                      )),
                  Expanded(
                      flex: 4,
                      child: Center(
                        child: CarouselSlider(
                          carouselController: _carouselController,
                          options: CarouselOptions(
                              viewportFraction: 1,
                              aspectRatio: 1,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.scale,
                              // enlargeCenterPage: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              }),
                          items: onboarding.map((e) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                WhiteText(
                                  text: e.message,
                                  weight: FontWeight.normal,
                                  size: 24,
                                  margin: EdgeInsets.only(top: 60, bottom: 15),
                                ),
                                CircleAvatar(
                                  backgroundColor: CustomColors.white,
                                  radius: 75,
                                  child: Image.asset(e.image),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      )),
                  Expanded(
                      child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: onboarding
                            .map((e) => InkWell(
                                  onTap: () {
                                    _carouselController
                                        .animateToPage(onboarding.indexOf(e));
                                    setState(() {
                                      _current = onboarding.indexOf(e);
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    height: 16,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: _current == onboarding.indexOf(e)
                                          ? CustomColors.secondary
                                          : CustomColors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0x4cd20000),
                                          offset: Offset(0, 3),
                                          blurRadius: 6,
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: PrimaryButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(),
                                ));
                          },
                          buttonText: 'START',
                        ),
                      )
                    ],
                  ))
                ],
              ),
            )
          ],
        )),
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

class OnboardingItems {
  String image;
  String message;

  OnboardingItems({
    required this.image,
    required this.message,
  });
}
