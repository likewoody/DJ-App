import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/model/model_diagnosis.dart';
import 'package:dj_app/vm/db_diagnosis_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class VMDiagnosisInsert extends ChangeNotifier {
  late DatabaseHandler dbhandler = DatabaseHandler();
  final box = GetStorage();

  
  insertAction(consent, alcohol, fruit, genhlth, heart, highBp,email) async {
    FirebaseFirestore.instance.collection('dangjin').add({
      'consent': consent,
      'alcohol': alcohol,
      'fruit': fruit,
      'genhlth': genhlth,
      'heart': heart,
      'highBp': highBp,
      'email': email,
      'initdate': DateTime.now().toString(),
    });
    notifyListeners();
    Get.back();
  }

  insertSQLite(consent, alcohol, fruit, genhlth, heart, highBp,email) async{
    await dbhandler.insertDiagnosis(
      Diagnosis(
        alcohol: alcohol,
        consent: consent,
        fruit: fruit,
        genhlth: genhlth,
        heart: heart,
        highBp: highBp,
        email: email,
        initdate: DateTime.now().toString()
        )
    );
  }

}
