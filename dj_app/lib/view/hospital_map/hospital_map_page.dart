import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HospitalMap extends StatefulWidget {
  const HospitalMap({super.key});

  @override
  State<HospitalMap> createState() => _HospitalMapState();
}

class _HospitalMapState extends State<HospitalMap> {
  static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _pGooglePlex,
          zoom: 13,
        ),
      ),
    );
  }
}
