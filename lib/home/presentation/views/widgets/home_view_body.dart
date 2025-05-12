import 'package:flutter/material.dart';
import 'package:maps/map/presentation/views/current_location_view.dart';
import 'package:maps/map/presentation/views/near_by_view.dart';
import 'package:maps/map/presentation/views/search_place_view.dart';

import '../../../../map/presentation/views/map_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MapView()));
            },
            child: const Text('Go Map'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CurrentLocationView()));
            },
            child: const Text('Current location'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SearchPlaceView()));
            },
            child: const Text('Search Place'),
          ),
          ElevatedButton(
            // style: ElevatedButton.styleFrom(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(5)))),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const NearByView()));
            },
            child: const Text('Near By View'),
          ),
        ],
      ),
    );
  }
}
