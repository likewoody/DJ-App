import 'dart:async';
import 'package:dj_app/vm/vm_hospital_map_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HospitalMap extends StatefulWidget {
  const HospitalMap({super.key});

  @override
  State<HospitalMap> createState() => _HospitalMapState();
}

class _HospitalMapState extends State<HospitalMap> {
  // --- Properties ---
  final HospitalMapGetX hospitalMapGetX = Get.put(HospitalMapGetX());

  late TextEditingController _textEditingController;

  late Location _locationController;

  late Completer<GoogleMapController> _mapContorller;

  late LatLng _currentP;

  // initState
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _locationController = Location();
    _mapContorller = Completer<GoogleMapController>();
    _currentP = const LatLng(37.4944858, 127.030066);
    hospitalMapGetX.getHospitalJSONData();
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
    GoogleMapController controller = await _mapContorller.future;
    CameraPosition newCameraPosition = CameraPosition(
      target: pos,
      zoom: 13,
    );
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(newCameraPosition),
    );
  }

  _cameraToPositionSearch() async {
    hospitalMapGetX.hospitalName = _textEditingController.text.trim();
    await hospitalMapGetX.getHospitalLocationData();
    if (hospitalMapGetX.searchHospitalLocation.isNotEmpty) {
      GoogleMapController controller = await _mapContorller.future;
      CameraPosition serchCameraPosition = CameraPosition(
        target: LatLng(
          hospitalMapGetX.searchHospitalLocation[0]['wgs84Lat'],
          hospitalMapGetX.searchHospitalLocation[0]['wgs84Lon'],
        ),
        zoom: 13,
      );
      await controller.animateCamera(
        CameraUpdate.newCameraPosition(serchCameraPosition),
      );
      await controller.showMarkerInfoWindow(
        MarkerId(
          hospitalMapGetX.searchHospitalLocation[0]['hpid'],
        ),
      );
    }
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
                _cameraToPositionSearch();
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      ),
      body: hospitalMapGetX.hospitalData.isEmpty
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
                  hospitalMapGetX.hospitalData.length,
                  (index) {
                    return Marker(
                      markerId:
                          MarkerId(hospitalMapGetX.hospitalData[index]['hpid']),
                      icon: BitmapDescriptor.defaultMarker,
                      position: LatLng(
                        hospitalMapGetX.hospitalData[index]['wgs84Lat'],
                        hospitalMapGetX.hospitalData[index]['wgs84Lon'],
                      ),
                      infoWindow: InfoWindow(
                        title: hospitalMapGetX.hospitalData[index]['dutyName'],
                        snippet:
                            '${hospitalMapGetX.hospitalData[index]['dutyAddr']}\n${hospitalMapGetX.hospitalData[index]['dutyTel1']}',
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
} // End
