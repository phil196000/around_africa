import 'dart:developer';
import 'package:around_africa/data/touristspot.dart';
import 'package:around_africa/navigation/appbar.dart';
import 'package:around_africa/navigation/drawer.dart';
import 'package:around_africa/screens/details/urllaunch.dart';
import 'package:flutter/material.dart';
import 'package:around_africa/navigation/bottomButtons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({Key? key, required this.spot}) : super(key: key);
  final TouristSpot spot;

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

              markers: <Marker>{
                Marker(
                    markerId: MarkerId(widget.spot.id.toString()),
                    infoWindow: InfoWindow(title: widget.spot.name),
                    position: LatLng(
                      widget.spot.location!['lat'],
                      widget.spot.location!['long'],
                    ))
              },

              initialCameraPosition: _currentPostion,
              onMapCreated: (GoogleMapController controller) {
                // _controller.complete(controller);
                _controller = controller;
                controller.animateCamera(CameraUpdate.newLatLngZoom(
                    LatLng(
                      widget.spot.location!['lat'],
                      widget.spot.location!['long'],
                    ),
                    17.5));
              },
            ),
          )
        ],
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

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
    }
    // TODO: implement dispose
    super.dispose();
  }
}
