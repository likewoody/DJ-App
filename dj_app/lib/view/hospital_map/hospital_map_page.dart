import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HospitalMap extends StatefulWidget {
  const HospitalMap({super.key});

  @override
  State<HospitalMap> createState() => _HospitalMapState();
}

class _HospitalMapState extends State<HospitalMap> {
  // --- Properties ---
  late TextEditingController _textEditingController;

  late Location _locationController;

  late Completer<GoogleMapController> _mapContorller;

  late LatLng _pAsan;
  late LatLng _pSamsung;

  late LatLng _currentP;

  // initState
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _locationController = Location();
    _mapContorller = Completer<GoogleMapController>();
    _pAsan = const LatLng(37.5265455, 127.1081223);
    _pSamsung = const LatLng(37.4881193, 127.0849885);
    _currentP = const LatLng(0, 0);
    getLocationUpdates();
  }

  Future<void> getLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.denied) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        _currentP =
            LatLng(currentLocation.latitude!, currentLocation.longitude!);
        _cameraToPosition(_currentP);
        print(_currentP);
        setState(() {});
      }
    });
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapContorller.future;
    CameraPosition newCameraPosition = CameraPosition(
      target: pos,
      zoom: 13,
    );
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(newCameraPosition),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: SearchBar(
          controller: _textEditingController,
          shape: MaterialStateProperty.all(
            ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          trailing: [
            IconButton(
              onPressed: () {
                print(_textEditingController.text);
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      ),
      body: _currentP == const LatLng(0, 0)
          ? const Center(
              child: Text("Loading..."),
            )
          : GoogleMap(
              onMapCreated: (GoogleMapController controller) =>
                  _mapContorller.complete(controller),
              initialCameraPosition: CameraPosition(
                target: _currentP,
                zoom: 15,
              ),
              myLocationEnabled: true,
              markers: {
                Marker(
                  markerId: MarkerId("_currentLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _currentP,
                ),
                Marker(
                  markerId: MarkerId("_sourceLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pAsan,
                ),
                Marker(
                  markerId: MarkerId("_destinationLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pSamsung,
                ),
              },
            ),
    );
  }
} // End
