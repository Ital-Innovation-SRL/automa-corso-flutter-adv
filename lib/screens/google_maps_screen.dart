import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: GoogleMap(
          mapType: MapType.satellite,
          markers: {
            Marker(
              onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => const Card(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Text("Info aggiuntiva"),
                  ),
                ),
              markerId: const MarkerId("colosseum"),
              icon: BitmapDescriptor.defaultMarker,
              position: const LatLng(41.8906032, 12.4877369),
              infoWindow: const InfoWindow(
                title: "Colosseo",
                snippet: "Snippet colosseo",
              ),
            ),
          },
          initialCameraPosition: const CameraPosition(
            target: LatLng(41.8906032, 12.4877369),
            zoom: 14,
          ),
          onMapCreated: _controller.complete,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            GoogleMapController c = await _controller.future;
            c.animateCamera(
              CameraUpdate.newCameraPosition(
                const CameraPosition(
                  target: LatLng(45.4640976, 9.1897378),
                  zoom: 5,
                ),
              ),
            );
          },
          child: const Icon(Icons.downhill_skiing),
        ),
      );
}
