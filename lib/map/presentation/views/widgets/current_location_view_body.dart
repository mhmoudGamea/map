import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationViewBody extends StatelessWidget {
  final CameraPosition cameraPosition;
  final Set<Marker> markers;
  const CurrentLocationViewBody(
      {super.key, required this.cameraPosition, required this.markers});
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: cameraPosition,
      mapType: MapType.normal,
      onMapCreated: (GoogleMapController controller) {
        // _googleMapController = controller;
      },
      markers: markers,
      zoomControlsEnabled: false,
    );
  }
}
