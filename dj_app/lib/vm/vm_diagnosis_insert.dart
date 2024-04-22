import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dj_app/model/model_diagnosis.dart';
import 'package:dj_app/vm/db_diagnosis_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VMDiagnosisInsert extends ChangeNotifier {
  late DatabaseHandler dbhandler = DatabaseHandler();

  
  insertAction(consent, alcohol, fruit, genhlth, heart, highBp, email, result) async {
    FirebaseFirestore.instance.collection('dangjin').add({
      'consent': consent,
      'alcohol': alcohol,
      'fruit': fruit,
      'genhlth': genhlth,
      'heart': heart,
      'highBp': highBp,
      'email': email,
      'result': result,
      'initdate': DateTime.now().toString(),
    });
    notifyListeners();
    Get.back();
  }

  insertSQLite(consent, alcohol, fruit, genhlth, heart, highBp, email, result) async{
    await dbhandler.insertDiagnosis(
      Diagnosis(
        alcohol: alcohol,
        consent: consent,
        fruit: fruit,
        genhlth: genhlth,
        heart: heart,
        highBp: highBp,
        email: email,
        result: result,
        initdate: DateTime.now().toString()
        )
    );
  }

}
