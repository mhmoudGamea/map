import 'package:flutter/material.dart';
import 'widgets/near_by_view_body.dart';

class NearByView extends StatelessWidget {
  const NearByView({super.key});

  @override
  Widget build(BuildContext context) {
    // GlobalKey<NearByViewBodyState> mapKey = GlobalKey<NearByViewBodyState>();
    return Scaffold(
      body: NearByViewBody(),
    );
  }
}
