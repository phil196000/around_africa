import 'dart:developer';
import 'package:around_africa/navigation/appbar.dart';
import 'package:around_africa/navigation/drawer.dart';
import 'package:flutter/material.dart';
import 'package:around_africa/navigation/bottomButtons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  GoogleMapController? _controller;
  CameraPosition _currentPostion = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 5.4746,
  );
  bool locationServices = false;
  CameraPosition? centerPosition;
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
            child: GoogleMap(
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              // scrollGesturesEnabled: show != "confirm",
              scrollGesturesEnabled: true,
              rotateGesturesEnabled: false,

              mapType: MapType.normal,
              onCameraMove: (position) {},

              markers: <Marker>{},

              initialCameraPosition: _currentPostion,
              onMapCreated: (GoogleMapController controller) {
                // _controller.complete(controller);
                _controller = controller;
              },
            ),
          )
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
