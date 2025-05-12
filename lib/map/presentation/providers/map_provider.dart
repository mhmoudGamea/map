import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider extends ChangeNotifier {
  CameraPosition? _cameraPosition;
  CameraPosition? get getMyCameraPosition => _cameraPosition;

  final Set<Marker> _markers = {};
  Set<Marker> get getMarkers => _markers;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<Position> checkLocationServiceAndPermisiions() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      throw Future.error('location service is not enabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Future.error('permission is denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Future.error('permission is denied forever');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getCameraPosition() async {
    try {
      _isLoading = true;
      notifyListeners();
      final position = await checkLocationServiceAndPermisiions();
      _cameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 16.0,
      );
      _markers.add(
        Marker(
          markerId: const MarkerId('1'),
          position: LatLng(position.latitude, position.longitude),
        ),
      );
    } catch (error) {
      log(error.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
