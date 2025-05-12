import 'package:flutter/material.dart';

import 'widgets/search_place_view_body.dart';

class SearchPlaceView extends StatelessWidget {
  const SearchPlaceView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<SearchPlaceViewBodyState> mapKey =
        GlobalKey<SearchPlaceViewBodyState>();
    return Scaffold(
      body: SafeArea(child: SearchPlaceViewBody(key: mapKey)),
    );
  }
}
