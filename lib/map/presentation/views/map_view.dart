import 'package:flutter/material.dart';

import 'widgets/map_view_body.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<MapViewBodyState> mapKey = GlobalKey<MapViewBodyState>(); // <--->
    return Scaffold(
      body: MapViewBody(key: mapKey),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          mapKey.currentState!.moveToTarget();
        },
        label: const Text('Go To Lake'),
        icon: Icon(
          Icons.water,
        ),
      ),
    );
  }
}
