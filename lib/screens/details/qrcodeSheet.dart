import 'package:around_africa/data/touristspot.dart';
import 'package:around_africa/theme/colors.dart';
import 'package:flutter/material.dart';

class QrCodeSheet extends StatefulWidget {
  const QrCodeSheet({Key? key, required this.spot}) : super(key: key);
  final TouristSpot spot;
  @override
  _QrCodeSheetState createState() => _QrCodeSheetState();
}

class _QrCodeSheetState extends State<QrCodeSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(widget.spot.qrcode!,
                  loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              }),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text('Scan QR Code to View Details of Location'),
              )
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              alignment: Alignment.topRight,
              child: IconButton(
                color: CustomColors.primary,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              ),
            ),
          )
        ],
      ),
    );
  }
}
