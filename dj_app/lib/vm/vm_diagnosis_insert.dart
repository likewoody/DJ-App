import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VMDiagnosisInsert extends ChangeNotifier {

  bool _isloading = true;
  
  insertAction(consent, alcohol, fruit, genhlth, heart, highBp) async {
    FirebaseFirestore.instance.collection('dangjin').add({
      'consent': consent,
      'alcohol': alcohol,
      'fruit': fruit,
      'genhlth': genhlth,
      'heart': heart,
      'highBp': highBp,
      'initdate': DateTime.now().toString(),
    });
    notifyListeners();
    Get.back();
  }

}
