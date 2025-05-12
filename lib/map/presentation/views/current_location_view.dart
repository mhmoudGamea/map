import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/map_provider.dart';
import 'widgets/current_location_view_body.dart';

class CurrentLocationView extends StatelessWidget {
  const CurrentLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MapProvider>(
      create: (context) => MapProvider(),
      child: Scaffold(
        body: Consumer<MapProvider>(
          builder: (context, provider, child) {
            return provider.isLoading
                ? Center(child: CircularProgressIndicator())
                : provider.getMyCameraPosition == null
                    ? Center(
                        child: ElevatedButton(
                            onPressed: () {
                              provider.getCameraPosition();
                            },
                            child: Text('get current location')),
                      )
                    : CurrentLocationViewBody(
                        cameraPosition: provider.getMyCameraPosition!,
                        markers: provider.getMarkers,
                      );
          },
        ),
      ),
    );
  }
}
//CurrentLocationViewBody()
