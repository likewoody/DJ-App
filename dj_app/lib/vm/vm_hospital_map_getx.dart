import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HospitalMapGetX extends GetxController {
  // --- Field ---
  List hospitalData = [];
  List searchHospitalLocation = [];
  String hospitalName = '';

  // --- Method ---
  getHospitalJSONData() async {
    var url = Uri.parse('http://localhost:8080/hospital');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON;
    hospitalData.addAll(result);
    update();
  }

  getHospitalLocationData() async {
    searchHospitalLocation.clear();
    var url = Uri.parse('http://localhost:8080/hospital/location?&dutyName=$hospitalName');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON;
    searchHospitalLocation.addAll(result);
    update();
  }
}
