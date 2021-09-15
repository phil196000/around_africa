import 'package:around_africa/customised_widgets/texts/blacktext.dart';
import 'package:around_africa/data/item.dart';
import 'package:around_africa/data/touristspot.dart';
import 'package:around_africa/screens/details/details.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({Key? key, required this.spot}) : super(key: key);
  final TouristSpot spot;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(
                      spot: spot,
                    ),
                  ));
            },
            leading: Container(
              width: 70,
              height: 100,
              child: Image.network(
                spot.thumbnail_url.toString(),
                fit: BoxFit.fitWidth,
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
            ),
            title: BlackText(
              text: spot.name.toString(),
            ),
            subtitle: BlackText(
                weight: FontWeight.normal,
                text: spot.short_description!.length > 50
                    ? spot.short_description!.substring(0, 50) + '...'
                    : spot.short_description!),
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
