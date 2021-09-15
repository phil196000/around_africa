import 'dart:developer';
import 'package:around_africa/customised_widgets/buttons/primarybutton.dart';
import 'package:around_africa/customised_widgets/texts/blacktext.dart';
import 'package:around_africa/data/item.dart';
import 'package:around_africa/data/touristspot.dart';
import 'package:around_africa/navigation/appbar.dart';
import 'package:around_africa/navigation/drawer.dart';
import 'package:around_africa/screens/details/map.dart';
import 'package:around_africa/screens/details/qrcodeSheet.dart';
import 'package:around_africa/screens/details/urllaunch.dart';
import 'package:around_africa/screens/onboarding/onboarding.dart';
import 'package:around_africa/theme/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:around_africa/navigation/bottomButtons.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  final TouristSpot spot;
  const Details({Key? key, required this.spot}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  CarouselController _carouselController = CarouselController();
  bool showmore = false;
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
              flex: 4,
              child: Center(
                child: CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                      viewportFraction: 1,
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      // enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  items: widget.spot.images!.map((e) {
                    return Image.network(
                      e,
                      fit: BoxFit.fitWidth,
                      width: MediaQuery.of(context).size.width,
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
                    );
                  }).toList(),
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.spot.images!
                .map((e) => InkWell(
                      onTap: () {
                        _carouselController
                            .animateToPage(widget.spot.images!.indexOf(e));
                        setState(() {
                          _current = widget.spot.images!.indexOf(e);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10, top: 5),
                        height: 10,
                        width: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: _current == widget.spot.images!.indexOf(e)
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
              flex: 6,
              child: Column(
                children: [
                  ListTile(
                    title: BlackText(
                      text: widget.spot.name.toString(),
                    ),
                    subtitle: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        BlackText(
                            weight: FontWeight.normal,
                            text: widget.spot.short_description!.length > 30 &&
                                    !showmore
                                ? widget.spot.short_description!
                                        .substring(0, 22) +
                                    '...'
                                : widget.spot.short_description!),
                        Visibility(
                            child: InkWell(
                          onTap: () {
                            setState(() {
                              showmore = !showmore;
                            });
                          },
                          child: Text(showmore ? 'readless' : 'readmore'),
                        ))
                      ],
                    ),
                    trailing: PrimaryButton(
                      buttonText: 'GO',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Map(
                                spot: widget.spot,
                              ),
                            ));
                      },
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 65),
                    child: Container(
                      child: BlackText(
                        weight: FontWeight.normal,
                        text: widget.spot.full_description.toString(),
                      ),
                    ),
                  ))
                ],
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            builder: (context) {
              return QrCodeSheet(
                spot: widget.spot,
              );
            },
          );
        },
        child: Icon(Icons.qr_code),
      ),
      persistentFooterButtons: [
        BottomButtons(
          emailPressed: () {
            launchUrl(url: 'mailto:${widget.spot.email}');
          },
          phonePressed: () {
            launchUrl(url: "tel:" + widget.spot.phone_number!);
          },
        )
      ],
    );
  }
}
