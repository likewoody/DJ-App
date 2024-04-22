import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class DangjinRConnect extends GetxController{

  // Field
  String age = '';
  String gender = '';
  String weight = '';
  String height = '';
  String consent = '';
  String alcohol = '';
  String fruit = '';
  String heart = '';
  String genHlth = '';
  String highBp = '';
  String result = '';


  // Method
  getDangjinRConnect() async{
    var url = Uri.parse('http://localhost:8080/dangjin/r?&age=$age&gender=$gender&weight=$weight&height=$height&alcohol=$alcohol&fruit=$fruit&heart=$heart&genHlth=$genHlth&highBp=$highBp');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    result = dataConvertedJSON;
    update();
  }








}