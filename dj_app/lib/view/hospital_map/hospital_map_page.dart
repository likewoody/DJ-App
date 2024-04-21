import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

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

  late LatLng _currentP;

  late List hospitalData;

  // initState
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _locationController = Location();
    _mapContorller = Completer<GoogleMapController>();
    _currentP = const LatLng(37.4944858, 127.030066);
    hospitalData = [];
    getJSONData();
    getLocationUpdates();
  }

  getJSONData() async {
    var url = Uri.parse('http://localhost:8080/hospital');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON;
    hospitalData.addAll(result);
    setState(() {});
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
      body: hospitalData.isEmpty
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
              markers: Set.from(
                List.generate(
                  hospitalData.length,
                  (index) {
                    return Marker(
                      markerId: MarkerId(hospitalData[index]['hpid']),
                      icon: BitmapDescriptor.defaultMarker,
                      position: LatLng(
                        hospitalData[index]['wgs84Lat'],
                        hospitalData[index]['wgs84Lon'],
                      ),
                      infoWindow: InfoWindow(
                        title: hospitalData[index]['dutyName'],
                        snippet: '${hospitalData[index]['dutyAddr']}\n${hospitalData[index]['dutyTel1']}',
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
} // End
