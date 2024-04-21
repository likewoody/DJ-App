import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VMDiagnosisInsert extends ChangeNotifier {

  bool _isloading = true;
  
  insertAction(consent, alcohol, fruit, genhlth, heart, highBp) async {
    notifyListeners();
    _isloading = true;
    _loadingDialog();
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
    _isloading = false;
    Get.back();
  }

  _loadingDialog() {
    if (_isloading) {
      Get.defaultDialog(
        barrierDismissible: false,
        title: '안내',
        middleText: '저장 중 입니다. 잠시만 기다려주세요.',
      );
    }
  }
}
