import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';

class SearchPlaceViewBody extends StatefulWidget {
  const SearchPlaceViewBody({super.key});

  @override
  State<SearchPlaceViewBody> createState() => SearchPlaceViewBodyState();
}

class SearchPlaceViewBodyState extends State<SearchPlaceViewBody> {
  late GoogleMapController mapController;
  final TextEditingController _searchController = TextEditingController();
  final CameraPosition _initialPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GooglePlaceAutoCompleteTextField(
            textEditingController: _searchController,
            googleAPIKey: 'AIzaSyDbtJldv_G9nvMNo_Eh2PMRZgJR7tgUvm8',
            inputDecoration: InputDecoration(
              hintText: 'Search for places...',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(8.0),
            ),
            debounceTime: 800,
            countries: ['us'],
            getPlaceDetailWithLatLng: (prediction) {
              print('Place ID: ${prediction.placeId}');
              print('Description: ${prediction.description}');
            },
          ),
        ),
        Expanded(
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialPosition.target,
              zoom: 10.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
          ),
        ),
      ],
    );
  }
}
