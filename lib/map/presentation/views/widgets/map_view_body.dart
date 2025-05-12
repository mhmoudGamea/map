import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewBody extends StatefulWidget {
  const MapViewBody({super.key});

  @override
  State<MapViewBody> createState() => MapViewBodyState();
}

class MapViewBodyState extends State<MapViewBody> {
  late GoogleMapController _mapController;
  final CameraPosition _initialPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);
  final CameraPosition _targetPosition = CameraPosition(
    target: LatLng(37.43296265331129, -122.08832357078792),
    zoom: 14,
    bearing: 190.0,
    tilt: 60,
  );
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _initialPosition,
      mapType: MapType.normal,
      onMapCreated: (GoogleMapController controller) =>
          _mapController = controller,
    );
  }

  // change camera position
  void moveToTarget() async {
    // final controller = await _mapController.future;
    _mapController
        .animateCamera(CameraUpdate.newCameraPosition(_targetPosition));
  }
}
