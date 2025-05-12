import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NearByViewBody extends StatefulWidget {
  const NearByViewBody({super.key});

  @override
  State<NearByViewBody> createState() => NearByViewBodyState();
}

class NearByViewBodyState extends State<NearByViewBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                getNearbyPlaces();
              },
              child: const Text('Get Near By')),
        ],
      ),
    );
  }

  Future<void> getNearbyPlaces() async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.86,151.20&radius=1500&type=restaurant&keyword=cruise&key=kk');
    final response = await http.post(url);
    print(jsonDecode(response.body));
    // make your own model that will contain this rsponse
    // then use it in ui
    // setsstate
  }
}
