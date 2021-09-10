import 'dart:developer';

import 'package:around_africa/customised_widgets/buttons/primarybutton.dart';
import 'package:around_africa/customised_widgets/texts/blacktext.dart';
import 'package:around_africa/customised_widgets/texts/whitetext.dart';
import 'package:around_africa/navigation/appbar.dart';
import 'package:around_africa/navigation/drawer.dart';
import 'package:around_africa/screens/home/item.dart';
import 'package:around_africa/screens/onboarding/onboarding.dart';
import 'package:around_africa/theme/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:around_africa/navigation/bottomButtons.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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
      body: Column(
        children: [
          Expanded(
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
                    CircleAvatar(
                      backgroundColor: CustomColors.white,
                      radius: 30,
                      child: Image.asset(e.image),
                    ),
                  ],
                );
              }).toList(),
            ),
          )),
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
          Divider(
            thickness: 3,
          ),
          Expanded(
              child: Column(
            children: [
              ListTile(
                title: BlackText(
                  text: 'Title 1',
                ),
                subtitle: BlackText(
                  weight: FontWeight.normal,
                  text: 'Lorem ipsum is simply',
                ),
                trailing: PrimaryButton(
                  buttonText: 'GO',
                  onPressed: () {},
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                  child: BlackText(
                    text:
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.',
                  ),
                ),
              ))
            ],
          ))
        ],
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
